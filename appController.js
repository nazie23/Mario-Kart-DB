const express = require('express');
const appService = require('./appService');

const router = express.Router();

// ----------------------------------------------------------
// API endpoints
// Modify or extend these routes based on your project's needs.
router.get('/check-db-connection', async (req, res) => {
    const isConnect = await appService.testOracleConnection();
    if (isConnect) {
        res.send('connected');
    } else {
        res.send('unable to connect');
    }
});

router.get('/demotable', async (req, res) => {
    const tableContent = await appService.fetchDemotableFromDb();
    res.json({data: tableContent});
});

router.get('/kartTable', async (req, res) => {
    const tableContent = await appService.fetchKartTableFromDb();
    res.json({data: tableContent});
});

router.get('/characterTable', async (req, res) => {
    const tableContent = await appService.fetchCharacterTableFromDb();
    res.json({data: tableContent});
});

router.get('/trackHazardTable', async (req, res) => {
     const tableContent = await appService.fetchTrackHazardTableFromDb();
     res.json({data: tableContent});
});

router.get('/trackHazardColumns', async (req, res) => {
     const tableContent = await appService.fetchTrackHazardColumns();
     res.json({data: tableContent});
});

router.post("/initiate-demotable", async (req, res) => {
    //console.log("calling initiate-demotable...");
    const initiateResult = await appService.initiateDemotable();
    if (initiateResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.post("/insert-demotable", async (req, res) => {
    const { PlayerID, email, userName, nickName, Country } = req.body;
    const insertResult = await appService.insertDemotable(PlayerID, email, userName, nickName, Country);
    if (insertResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.post("/update-kartTable", async (req, res) => {
    const { kartID, updatedData } = req.body;
    console.log("Updated data:", updatedData);

    // Ensure kartID and updatedData are provided
    if (!kartID || !updatedData || !updatedData.kartName || !updatedData.handling || !updatedData.speed || !updatedData.weights || !updatedData.acceleration) {
        return res.status(400).json({
            success: false,
            message: "Invalid input. Ensure kartID and all fields in updatedData (kartName, handling, speed, weights, acceleration) are provided."
        });
    }

    try {
        const { kartName, handling, speed, weights, acceleration } = updatedData;
        const handlingValue = parseFloat(handling);
        const speedValue = parseFloat(speed);
        const weightsValue = parseFloat(weights);
        const accelerationValue = parseFloat(acceleration);

        const updateResult = await appService.updateKart(kartID, kartName, handlingValue, speedValue, weightsValue, accelerationValue);
        console.log(updateResult);

        if (updateResult) {
            res.json({ success: true });
        } else {
            res.status(500).json({
                success: false,
                message: "Update failed. Make sure the kartID exists and the data is valid."
            });
        }
    } catch (error) {
        console.error("Error updating kart:", error); // Log error for debugging
        res.status(500).json({
            success: false,
            message: error.message || "An error occurred while updating kart data."
        });
    }
});

router.post("/delete-demotable", async (req, res) => {
    const {colName, val} = req.body;
    const deleteResult = await appService.deleteDemotable(colName, val);
    if (deleteResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.get('/count-demotable', async (req, res) => {
    const tableCount = await appService.countDemotable();
    if (tableCount >= 0) {
        res.json({ 
            success: true,  
            count: tableCount
        });
    } else {
        res.status(500).json({ 
            success: false, 
            count: tableCount
        });
    }
});

router.post("/projection-demotable", async (req, res) => {
    const columnNames = req.body.columns;
    const projectionResult = await appService.projection(columnNames);
    res.json(projectionResult);
});


router.post("/join-table", async (req, res) => {
    const { email, competitionID } = req.body;
    console.log(email, competitionID);
    const joinResult = await appService.join(email, competitionID);
    res.json(joinResult);
});

router.get("/division-table", async (req, res) => {
    const divisionResult = await appService.division();
    res.json(divisionResult);
});

router.get('/groupBy-allCountriesTable', async (req, res) => {
    const tableContent = await appService.groupByAllCountriesTable();
    res.json({data: tableContent});
});

router.post('/groupBy-UserInputCountriesTable', async (req, res) => {
    const {countryCode} = req.body;
    const groupByResults = await appService.groupByUserInputCountriesTable(countryCode);
    res.json(groupByResults);
});

router.post('/nested-groupBy', async (req, res) => {
    console.log('in appController');

    const {groupBy, func, query} = req.body;
    const viewResult = await appService.createView(groupBy, func);
    if (!viewResult) {
        console.log('error!');
        res.status(500).json({ success: false });
    } else {
        console.log('created view');
        const groupByResult = await appService.nestedGroupBy(groupBy, query);

        res.json(groupByResult);
    }
});

router.get('/get-viewColumns', async (req, res) => {
    console.log('getting viewColumns');
    const tableContent = await appService.getViewColumns();
    res.json({data: tableContent});
});

router.get('/get-view', async (req, res) => {
    console.log('getting view');
    const tableContent = await appService.getView();
    res.json({data: tableContent});
});

router.post('/select-demotable', async (req, res) => {
    const { columns, filters } = req.body;
    const selectResults = await appService.selectDemoTable(columns, filters); 
    res.json(selectResults);
});

router.post('/count-participants', async (req, res) => {
    const { minParticipants } = req.body;
    const groupByResults = await appService.groupByHaving(minParticipants);
    res.json(groupByResults);
});




module.exports = router;