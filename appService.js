const oracledb = require('oracledb');
const loadEnvFile = require('./utils/envUtil');

const envVariables = loadEnvFile('./.env');
const fs = require('fs-extra');

// Database configuration setup. Ensure your .env file has the required database credentials.
const dbConfig = {
    user: envVariables.ORACLE_USER,
    password: envVariables.ORACLE_PASS,
    connectString: `${envVariables.ORACLE_HOST}:${envVariables.ORACLE_PORT}/${envVariables.ORACLE_DBNAME}`,
    poolMin: 1,
    poolMax: 10,
    poolIncrement: 1,
    poolTimeout: 60,
};

// initialize connection pool
async function initializeConnectionPool() {
    try {
        await oracledb.createPool(dbConfig);
        console.log('Connection pool started');
    } catch (err) {
        console.error('Initialization error: ' + err.message);
    }
}

async function closePoolAndExit() {
    console.log('\nTerminating');
    try {
        await oracledb.getPool().close(10); // 10 seconds grace period for connections to finish
        console.log('Pool closed');
        process.exit(0);
    } catch (err) {
        console.error(err.message);
        process.exit(1);
    }
}

initializeConnectionPool();

process
    .once('SIGTERM', closePoolAndExit)
    .once('SIGINT', closePoolAndExit);


// ----------------------------------------------------------
// Wrapper to manage OracleDB actions, simplifying connection handling.
async function withOracleDB(action) {
    let connection;
    try {
        connection = await oracledb.getConnection(); // Gets a connection from the default pool 
        return await action(connection);
    } catch (err) {
        console.error(err);
        throw err;
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
}


// ----------------------------------------------------------
// Core functions for database operations
// Modify these functions, especially the SQL queries, based on your project's requirements and design.
async function testOracleConnection() {
    return await withOracleDB(async (connection) => {
        return true;
    }).catch(() => {
        return false;
    });
}

async function fetchDemotableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT * FROM PLAYERACCOUNT');
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchKartTableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT * FROM KART');
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchCharacterTableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT * FROM CharacterInformation');
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchTrackHazardTableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`SELECT * FROM TrackHazard`);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function fetchTrackHazardColumns() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT COLUMN_NAME
            FROM USER_TAB_COLUMNS
            WHERE UPPER(TABLE_NAME) = 'TRACKHAZARD'`
        );
//        console.log('result1: ', result.rows);
        return result.rows.map(row => row[0]);
    }).catch(() => {
        return [];
    });
}

async function initiateDemotable() {
    return await withOracleDB(async (connection) => {
        try {
            console.log("load schema from file...");
            //read from schema (create table...) file
            let sqlscripts = await fs.readFile('InitDatabaseSchema.sql', 'utf-8'); 
            console.log(sqlscripts);
            //execute the schema scripts
            await connection.execute(sqlscripts);

            console.log('insert data')
            //read from data (insert into ...) file
            sqlscripts = await fs.readFile('InitDatabaseData.sql', 'utf-8')
            console.log(sqlscripts);
            await connection.execute(sqlscripts);
            await connection.commit();

            return true;
        } catch(err){
            console.log(err.message);
            return false;
        }
    }).catch((err) => {
        console.log(err.message)
        return false;
    });
}

async function insertDemotable(PlayerID, email, userName, nickName, Country) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `INSERT INTO PLAYERACCOUNT (PlayerID, email, userName, nickName, Country) VALUES (:PlayerID, :email, :userName, :nickName, :Country)`,
            [PlayerID, email, userName, nickName, Country],
            { autoCommit: true }
        );

        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function updateKart(kartID, kartName, handlingValue, speedValue, weightsValue, accelerationValue) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `UPDATE Kart 
             SET kartName = :kartName, 
                 handling = :handling, 
                 speed = :speed, 
                 weights = :weights, 
                 acceleration = :acceleration 
             WHERE kartID = :kartID`,
            {
                kartID: kartID,
                kartName: kartName,
                handling: handlingValue,
                speed: speedValue,
                weights: weightsValue,
                acceleration: accelerationValue
            },
            { autoCommit: true }
        );

        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function deleteDemotable(colName, val) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `DELETE FROM CharacterInformation WHERE ${colName} = :val`,
            {val},
            { autoCommit: true }
        );

        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        console.log('error');
        return false;
    });
}


async function countDemotable() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT Count(*) FROM DEMOTABLE');
        return result.rows[0][0];
    }).catch(() => {
        return -1;
    });
}

async function projection(columnNames) {
    // Join the column names with a comma to form the SELECT clause
    const columns = columnNames.join(', ');
    
    console.log(columns); // Logs: "PlayerID, email"

    return await withOracleDB(async (connection) => {
        // Dynamically construct the SQL query
        console.log('hi')
        const query = `SELECT ${columns} FROM Track`;
        console.log('hi2')
        
        const result = await connection.execute(query);
        console.log(result)
        return result; // Return all rows instead of just one
    }).catch((err) => {
        console.error('Error executing query:', err);
        return {error: err.message};
    });
}

async function join(email) {
    console.log(email);
    return await withOracleDB(async (connection) => {
        // Dynamically construct the SQL query based on email and competitionID
        const query = `
        SELECT c.winnerID, p.email, c.competitionID, c.competitionFormat
            FROM PlayerAccount p
            INNER JOIN CompetitionInformation c
            ON p.PlayerID = c.winnerID
            WHERE p.email =  :email`;

        // Pass the bind variables for both email and competitionID
        const result = await connection.execute(query, {
            email: { val: email },
        });

        return result; // Return all rows instead of just one
    }).catch((err) => {
        console.error('Error executing query:', err);
        return { error: err.message };
    });
}

async function groupByAllCountriesTable() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`
            SELECT Country, COUNT(*) AS TotalPlayers
                FROM PLAYERACCOUNT
                GROUP BY Country`);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function groupByUserInputCountriesTable(countryCode) {
    console.log(typeof countryCode)
    return await withOracleDB(async (connection) => {
        // Dynamically construct the SQL query based on email and competitionID
        const query = `
        SELECT Country, COUNT(*) AS TotalPlayers
            FROM PLAYERACCOUNT
            WHERE Country  =  :country   
            GROUP BY Country`;

        const result = await connection.execute(query, {
            country: { val: countryCode },
        });

        return result; // Return all rows instead of just one
    }).catch((err) => {
        console.error('Error executing query:', err);
        return { error: err.message };
    });
}

async function createView(groupBy, func) {
    return await withOracleDB(async (connection) => {
        let query;
        if (func == "AVERAGE") {
            query = `CREATE OR REPLACE VIEW temp AS
                    SELECT ${groupBy}, AVG(freq) AS "Number"
                    FROM TrackHazard
                    GROUP BY ${groupBy}`;
        } else if (func == "COUNT") {
            query = `CREATE OR REPLACE VIEW temp AS
                    SELECT ${groupBy}, COUNT(freq) AS "Number"
                    FROM TrackHazard
                    GROUP BY ${groupBy}`;
        }

        console.log('Executing query:', query);

        const result = await connection.execute(query);

        console.log('Query executed. Result:', result); // Inspect the result object
        return true;  // Return true on successful execution, even if no rows are affected
    }).catch(() => {
        console.log('error');
        return false;
    });
}

async function getViewColumns() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT COLUMN_NAME
             FROM USER_TAB_COLUMNS
             WHERE UPPER(TABLE_NAME) = 'TEMP'`
        );
        console.log(result.rows);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function getView() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(`SELECT * FROM temp`);
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function nestedGroupBy(groupBy, query) {
    console.log('nesting');

    console.log('groupBy:', groupBy);
    console.log('query:', query);

    return await withOracleDB(async (connection) => {
        let statement;
        if (query == "min") {
            statement = `SELECT *
                        FROM temp
                        WHERE "Number" = (SELECT MIN("Number") FROM temp)`;
        } else if (query == "max") {
            statement = `SELECT *
                        FROM temp
                        WHERE "Number" = (SELECT MAX("Number") FROM temp)`;
        }

        console.log('Executing statement:', statement);
        const result = await connection.execute(statement); // problem
        console.log('result rows: ', result.rows.flat());
        return result.rows.flat();
    }).catch(() => {
        console.log('error');
        return false;
    });
}

async function selectDemoTable(columns, filters) {

    return await withOracleDB(async (connection) => {
        // Start constructing the SELECT query
        let query = 'SELECT ';
        query += columns.join(', '); // Join selected columns into query string
        query += ' FROM PLAYERACCOUNT'; // Assuming table is PLAYERACCOUNT, adjust as necessary

        // Add filters if any
        let filterConditions = [];
        let queryParams = {};

        Object.keys(filters).forEach((column) => {
            if (filters[column]) {
                filterConditions.push(`${column} = :${column}`);
                queryParams[column] = { val: filters[column] }; // Bind values dynamically
            }
        });
    
        if (filterConditions.length > 0) {
            query += ' WHERE ' + filterConditions.join(' AND ');
        }

        const result = await connection.execute(query, queryParams);
        console.log(result);

        return result; // Return all rows instead of just one
    }).catch((err) => {
        console.error('Error executing query:', err);
        return { error: err.message };
    });
}

async function division() {
    console.log('Find all players that have been in every competition using the specified character');

    return await withOracleDB(async (connection) => {
        // Construct the SQL query using EXCEPT to find players who used the specified character in every competition
        const query = `
           SELECT p.*
            FROM PLAYERACCOUNT p
            WHERE NOT EXISTS (
                -- Check if there's any competition that the player has not competed in
                SELECT 1
                FROM CompetitionInformation c
                WHERE NOT EXISTS (
                    -- Check if the player participated in the competition
                    SELECT 1
                    FROM PlayerRace pr
                    WHERE pr.playerID = p.playerID
                    AND pr.competitionID = c.competitionID
                )
            )`;

        // Execute the query with parameter substitution
        const result = await connection.execute(query);

        console.log(result); // Debugging result
        return result; // Return the result rows
    }).catch((err) => {
        console.error('Error executing query:', err);
        return { error: err.message };
    });
}

async function groupByHaving(minParticipants) {
    return await withOracleDB(async (connection) => {
        const query = `
            SELECT competitionID, COUNT(playerID) AS ParticipantCount
            FROM PlayerRace
            GROUP BY competitionID
            HAVING COUNT(playerID) >= :minParticipants
        `;
        const result = await connection.execute(query, { minParticipants });
        return result; // Return results as an array
    }).catch((err) => {
        console.error('Error executing query:', err);
        return { error: err.message };
    });
}



module.exports = {
    testOracleConnection,
    fetchDemotableFromDb,
    initiateDemotable, 
    insertDemotable,
    deleteDemotable,
    updateKart, 
    countDemotable,
    projection,
    join,
    division,
    fetchKartTableFromDb,
    fetchCharacterTableFromDb,
    fetchTrackHazardTableFromDb,
    fetchTrackHazardColumns,
    groupByAllCountriesTable,
    groupByUserInputCountriesTable,
    createView,
    getViewColumns,
    getView,
    nestedGroupBy,
    getView,
    selectDemoTable,
    groupByHaving
};