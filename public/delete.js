// Fetch and display the Kart Table
async function fetchAndDisplayCharacterTable() {
    const tableElement = document.getElementById('characterTable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/characterTable', {
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

// deletes records from the demotable.
async function deleteDemotable(event) {
    event.preventDefault();

    const attrValue = document.getElementById('attr').value;
//    console.log(attrValue);
    const fieldValue = document.getElementById('insertValue').value;
//    console.log(fieldValue);

    const response = await fetch('/delete-demotable', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            colName: attrValue,
            val: fieldValue
        })
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('deleteResultMsg');

    if (responseData.success) {
        messageElement.textContent = "Data deleted successfully!";
        fetchAndDisplayCharacterTable();
    } else {
        messageElement.textContent = "Error deleting data!";
    }
}

// Initialize page functionalities.
window.onload = function() {
    fetchAndDisplayCharacterTable(); // Initially fetch and display the table data
    document.getElementById("deleteDemotable").addEventListener("submit", deleteDemotable);
}
