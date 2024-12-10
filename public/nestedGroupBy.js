async function populateColumnsTrackHazard() {
    try {
        const response = await fetch('/trackHazardColumns', {
            method: 'GET'
        });
        const result = await response.json();
        const columns = result.data;

//        console.log("result2: ", columns);

        const table = document.getElementById('table-header');

        // Always clear old, already fetched data before new fetching process.
         if (table) {
             table.innerHTML = '';
         }

        // Check if columns is actually an array
        if (Array.isArray(columns)) {
            columns.forEach(column => {
                if (column) {
                    const th = document.createElement('th');
                    th.textContent = column;
                    table.appendChild(th);
                }
            });
        } else {
            console.error('Expected columns to be an array, but received:', columns);
        }
    } catch (error) {
        console.error('Error fetching column names:', error);
    }
}

async function fetchAndDisplayTrackHazardTable() {
    const tableElement = document.getElementById('nestedGroupByTable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/trackHazardTable', {
        method: 'GET'
    });

    const responseData = await response.json();
    const tableContent = responseData.data;

    tableContent.forEach(user => {
        const row = tableBody.insertRow();
        user.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });

}

async function populateColumnsView() {
    try {
        const response = await fetch('/get-viewColumns', {
            method: 'GET'
        });
        const result = await response.json();
        const columns = result.data;

//        console.log("result2: ", columns);

        const table = document.getElementById('table-header');

        // Always clear old, already fetched data before new fetching process.
         if (table) {
             table.innerHTML = '';
         }

        // Check if columns is actually an array
        if (Array.isArray(columns)) {
            columns.forEach(column => {
                if (column) {
                    const th = document.createElement('th');
                    th.textContent = column;
                    table.appendChild(th);
                }
            });
        } else {
            console.error('Expected columns to be an array, but received:', columns);
        }
    } catch (error) {
        console.error('Error fetching column names:', error);
    }
}

async function fetchAndDisplayView(responseData) {
    const tableElement = document.getElementById('nestedGroupByTable');
    const tableBody = tableElement.querySelector('tbody');

//    console.log('responseData', responseData);

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    responseData.forEach((item, index) => {
        if (index % 2 === 0) { // Only process even-indexed items (track names)
            // Create a new row in the table body
            const row = tableBody.insertRow();

            // Insert cell for trackName
            const cell1 = row.insertCell();
            cell1.textContent = item; // This is the track name

            // Insert cell for freq
            const cell2 = row.insertCell();
            cell2.textContent = responseData[index + 1]; // This is the corresponding frequency
        }
    });

}

async function nestedGroupBy() {
    event.preventDefault();

    const groupValue = document.getElementById('groupBy').value;
    const funcValue = document.getElementById('func').value;
    const queryValue = document.getElementById('query').value;

    const response = await fetch('/nested-groupBy', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            groupBy: groupValue,
            func: funcValue,
            query: queryValue
        })
    });
    const responseData = await response.json();
    console.log('received result!: ', responseData);

    const messageElement = document.getElementById('nestedGroupResultMsg');

    if (responseData) {
        messageElement.textContent = "Data aggregated successfully!";
        populateColumnsView();
        fetchAndDisplayView(responseData);
    } else {
        messageElement.textContent = "Error aggregating data!";
    }

}


// Initialize page functionalities.
window.onload = function() {
    populateColumnsTrackHazard();
    fetchAndDisplayTrackHazardTable(); // Initially fetch and display the table data
    document.getElementById("form").addEventListener("submit", nestedGroupBy);
}