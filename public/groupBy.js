document.addEventListener('DOMContentLoaded', function () {
    const actionSelect = document.getElementById('action');
    const countryCodeInput = document.getElementById('countryCodeInput');

    // Set up an event listener for the dropdown
    actionSelect.addEventListener('change', function () {
        if (this.value === 'filter') {
            // Show the input when "Choose Country" is selected
            countryCodeInput.style.display = 'block';
        } else {
            // Hide the input when "Display All Countries" is selected
            countryCodeInput.style.display = 'none';
        }
    });
});

document.getElementById('submitBtn').addEventListener('click', function() {
    const action = document.getElementById('action').value;

    if (action === 'all') {
        console.log('Display All Countries');
        fetchAndDisplayGroupByAllCountries();
    } else if (action === 'filter') {
        console.log('Choose Country');
        fetchAndDisplayUserGroupBy();
    }
});


async function fetchAndDisplayUserGroupBy(){
    const country = document.getElementById('countryCode').value;

        // Validate inputs
        if (country === '') {
            alert('Please enter countryCode');
            return; // Stop further execution if any input is empty
        }
       countryCode = country.toUpperCase();

        try {
            const response = await fetch("/groupBy-UserInputCountriesTable", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({countryCode: countryCode})
            });

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            const responseData = await response.json();
            displayGroupByData(responseData);

        } catch (error) {
            console.error('Error during fetch:', error);
        }
    };

    async function displayGroupByData(responseData) {
        const tableElement = document.getElementById('groupByTable');
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

async function fetchAndDisplayGroupByAllCountries() {
    const tableElement = document.getElementById('groupByTable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/groupBy-allCountriesTable', {
        method: 'GET'
    });

    const responseData = await response.json();
    const demotableContent = responseData.data;
    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    demotableContent.forEach(user => {
        const row = tableBody.insertRow();
        user.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}




