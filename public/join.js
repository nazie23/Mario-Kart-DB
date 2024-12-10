// Fetch and display the join table data
async function fetchJoinTable() {
    document.getElementById('submitBtn').addEventListener('click', async function() {
        const playerEmail = document.getElementById('playerEmail').value;

        // Validate inputs
        if (playerEmail === '') {
            alert('Please enter both email');
            return; // Stop further execution if any input is empty
        }

        try {
            const response = await fetch("/join-table", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ email: playerEmail})
            });

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            const responseData = await response.json();
            displayJoinData(responseData);

        } catch (error) {
            console.error('Error during fetch:', error);
        }
    });
}

async function displayJoinData(responseData) {
    const tableElement = document.getElementById('joinTable');
    const tableHead = tableElement.querySelector('thead');
    const tableBody = tableElement.querySelector('tbody');

    // Clear previous table headers and data
    tableHead.innerHTML = '';
    tableBody.innerHTML = '';

    if (responseData && responseData.metaData && responseData.rows && responseData.rows.length > 0) {
        // Create table headers from responseData.metaData
        const headers = responseData.metaData.map(meta => meta.name);
        const headerRow = tableHead.insertRow();
        headers.forEach(header => {
            const headerCell = document.createElement('th');
            headerCell.textContent = header;
            headerRow.appendChild(headerCell);
        });

        // Populate the table body with rows of data
        responseData.rows.forEach(rowData => {
            const row = tableBody.insertRow();
            rowData.forEach((field, index) => {
                const cell = row.insertCell(index);
                cell.textContent = field;
            });
        });
    } else {
        const noDataRow = tableBody.insertRow();
        const noDataCell = noDataRow.insertCell(0);
        noDataCell.colSpan = 1; // Default colspan to 1 if no headers
        noDataCell.textContent = 'No data available';
    }
}

// Initialize page functionalities.
window.onload = function() {
    fetchJoinTable(); // Initialize the fetch and display functionality on page load
};
