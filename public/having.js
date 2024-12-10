document.getElementById('fetchParticipantCountsBtn').addEventListener('click', async function () {
    const minParticipants = document.getElementById('minParticipants').value;

    if (!minParticipants || isNaN(minParticipants) || parseInt(minParticipants, 10) < 1) {
        alert('Please enter a valid minimum participant count.');
        return;
    }

    try {
        console.log("trying to go to endpoin...");
        const response = await fetch("/count-participants", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ minParticipants: minParticipants})
        });

        if (!response.ok) {
            throw new Error('Failed to fetch data');
        }
        const responseData = await response.json();
        displayParticipantsData(responseData.rows);
        
    } catch (error) {
        console.error('Error:', error);
    }
});

function displayParticipantsData(data) {
    // console.log(data);
    const tableBody = document.getElementById('participantsTable').querySelector('tbody');
    tableBody.innerHTML = ''; // Clear existing data

    if (data.length != 0 ) {
        data.forEach(row => {
            const tableRow = document.createElement('tr');

            // Populate the row with competitionID and participant count
            const competitionCell = document.createElement('td');
            competitionCell.textContent = row[0]; // Match your column name
            const countCell = document.createElement('td');
            countCell.textContent = row[1]; // Match your column name

            tableRow.appendChild(competitionCell);
            tableRow.appendChild(countCell);
            tableBody.appendChild(tableRow);
        });
    } else {
        const noDataRow = tableBody.insertRow();
        const noDataCell = noDataRow.insertCell(0);
        noDataCell.colSpan = 2;
        noDataCell.textContent = 'No competitions meet the criteria.';
    }
}
