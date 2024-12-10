async function projectionDemotable() {

    const projectionForm = document.getElementById('projectionForm');
    const columns = document.getElementById('checkboxes');

    projectionForm.addEventListener('submit', async (event) => {
        event.preventDefault();
        console.log('clicked')
        const selectedColumns = Array.from(columns.querySelectorAll('.attribute:checked')).map(attribute => attribute.value);

        if(selectedColumns.length == 0) {
            document.getElementById('resultMsg').textContent = 'Please select at least one column';
            return;
        }

    const response = await fetch("/projection-demotable", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({columns: selectedColumns })
    });
    
    const responseData = await response.json();

        displayProjectionData(responseData);  
    })
    
}

async function displayProjectionData(responseData) {
    const tableElement = document.getElementById('projectionTable');
    const tableHead = tableElement.querySelector('thead');
    const tableBody = tableElement.querySelector('tbody');

    // Clear previous table headers and data
    tableHead.innerHTML = '';
    tableBody.innerHTML = '';

    // Check if there's data to display
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
        // Handle case where there is no data to display
        const noDataRow = tableBody.insertRow();
        const noDataCell = noDataRow.insertCell(0);
        noDataCell.colSpan = 1; // Default colspan to 1 if no headers
        noDataCell.textContent = 'No data available';
    }
}


window.onload = function() {
    projectionDemotable();
};