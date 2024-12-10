// Fetch and display the Kart Table
async function fetchAndDisplayKartTable() {
    const tableElement = document.getElementById('kartTable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/kartTable', {
        method: 'GET'
    });

    const responseData = await response.json();
    const kartTableContent = responseData.data;

    // Clear old data before populating with new data
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    kartTableContent.forEach((rowData) => {
        const row = tableBody.insertRow();

        // Array to store input elements and their original values for canceling
        const inputs = [];
        const originalValues = [...rowData]; // Copy of the original values

        // Populate cells with data and create input elements
        rowData.forEach((field, index) => {
            const cell = row.insertCell(index);
            const input = document.createElement('input');
            input.type = 'text';
            input.value = field;
            input.disabled = true; // Initially, inputs are disabled
            cell.appendChild(input);
            inputs.push(input); // Store the input element
        });

        // Add the "Update" button in the last cell
        const updateCell = row.insertCell(rowData.length);
        const updateButton = document.createElement('button');
        updateButton.textContent = 'Update';
        updateCell.appendChild(updateButton);

        // Add the "Cancel" button in the same cell
        const cancelButton = document.createElement('button');
        cancelButton.textContent = 'Cancel';
        cancelButton.style.display = 'none'; // Initially hidden
        updateCell.appendChild(cancelButton);

        // Add click event for the "Update" button to toggle editing mode
        updateButton.addEventListener('click', async () => {
            if (updateButton.textContent === 'Update') {
                // Enable editing
                inputs.forEach(input => input.disabled = false);
                updateButton.textContent = 'Save';
                cancelButton.style.display = 'inline'; // Show the "Cancel" button
            } else {
                // Collect the updated values
                const updatedData = inputs.map(input => input.value);
                console.log('frontend')
                console.log(updatedData);

                // Send the updated data to the server
                const updateResponse = await fetch('/update-kartTable', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        kartID: rowData[0], // kartID is assumed to be the first item in rowData
                        updatedData: {
                            kartName: updatedData[1],
                            handling: updatedData[2],
                            speed: updatedData[3],
                            weights: updatedData[4],
                            acceleration: updatedData[5]
                        }
                    })
                });

                const updateResult = await updateResponse.json();
                if (updateResult.success) {
                    alert('Update successful!');
                    fetchKartTableData(); // Refresh the table data after successful update
                } else {
                    alert('Update failed. Please try again.');
                }

                // Disable editing and change the button text back to "Update"
                inputs.forEach(input => input.disabled = true);
                updateButton.textContent = 'Update';
                cancelButton.style.display = 'none'; // Hide the "Cancel" button
            }
        });

        // Add click event for the "Cancel" button to revert changes
        cancelButton.addEventListener('click', () => {
            // Revert the input values to the original data
            inputs.forEach((input, index) => {
                input.value = originalValues[index];
                input.disabled = true; // Disable the inputs again
            });

            // Reset the button text and hide the "Cancel" button
            updateButton.textContent = 'Update';
            cancelButton.style.display = 'none';
        });
    });
}

// Function to refresh the displayed kart table data.
function fetchKartTableData() {
    fetchAndDisplayKartTable();
}


// Initialize page functionalities.
window.onload = function() {
    fetchKartTableData(); // Initially fetch and display the table data
    document.getElementById("resetKartTable").addEventListener("click", resetKartTable);
};
