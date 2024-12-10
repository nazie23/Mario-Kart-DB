async function fetchSelectDemoTable() {
    const selectForm = document.getElementById('selectForm');
    const resultsDiv = document.getElementById('results');

    selectForm.addEventListener('submit', async (event) => {
        event.preventDefault();

        // Get selected columns
        const selectedColumns = Array.from(document.querySelectorAll('.columns:checked')).map(
            (checkbox) => checkbox.value
        );

        console.log(selectedColumns);

        if (selectedColumns.length === 0) {
            resultsDiv.textContent = 'Please select at least one column to display.';
            return;
        }

        // Gather filters
        const filters = {};
        const filterInputs = document.querySelectorAll('input[name^="filters"]');
        filterInputs.forEach((input) => {
            if (input.value) {
                const columnName = input.name.match(/\[(.*?)\]/)[1]; // Extract column name from input name
                filters[columnName] = input.value;
            }
        });

        // Prepare the request payload
        const requestBody = {
            columns: selectedColumns,
            filters: filters,
        };

        console.log(requestBody);

        try {
            // Send the POST request to the backend
            const response = await fetch('/select-demotable', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestBody),
            });

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            console.log(response);
            
            const responseData = await response.json();
            
            // Display the data
            displaySelectData(responseData);
        } catch (error) {
            console.error('Error fetching data:', error);
            resultsDiv.textContent = 'Error fetching data. Please try again later.';
        }
    });
}

function displaySelectData(responseData) {
    const resultsDiv = document.getElementById('results');
    resultsDiv.innerHTML = ''; // Clear previous results

    if (responseData && responseData.metaData && responseData.rows.length > 0) {
        // Create table elements
        const table = document.createElement('table');
        const thead = document.createElement('thead');
        const tbody = document.createElement('tbody');

        // Add table headers
        const headerRow = document.createElement('tr');
        responseData.metaData.forEach((meta) => {
            const th = document.createElement('th');
            th.textContent = meta.name;
            headerRow.appendChild(th);
        });
        thead.appendChild(headerRow);

        // Add table rows
        responseData.rows.forEach((row) => {
            const tr = document.createElement('tr');
            row.forEach((value) => {
                const td = document.createElement('td');
                td.textContent = value;
                tr.appendChild(td);
            });
            tbody.appendChild(tr);
        });

        table.appendChild(thead);
        table.appendChild(tbody);
        resultsDiv.appendChild(table);
    } else {
        resultsDiv.textContent = 'No data available for the given criteria.';
    }
}

// Initialize on page load
window.onload = fetchSelectDemoTable;
