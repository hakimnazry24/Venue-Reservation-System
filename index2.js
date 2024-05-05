document.addEventListener("DOMContentLoaded", function() {
    const addVenueBtn = document.getElementById("addVenueBtn");
    const venueTable = document.getElementById("venueTable").getElementsByTagName('tbody')[0];
    const viewReservations = document.getElementById("viewReservations");
  
    addVenueBtn.addEventListener("click", function() {
    // Functionality to add a new venue
    const venueName = prompt("Enter Venue Name:");
    const venueLocation = prompt("Enter Venue Location:");
    const quantity = prompt("Enter Quantity:");
    const imageURL = prompt("Enter Image URL:"); // For simplicity, you can use prompt to get the image URL
    // Add a new row to the table
    const newRow = venueTable.insertRow();
    const cell1 = newRow.insertCell(0);
    const cell2 = newRow.insertCell(1);
    const cell3 = newRow.insertCell(2);
    const cell4 = newRow.insertCell(3);
    const cell5 = newRow.insertCell(4);
    cell1.textContent = venueName;
    cell2.textContent = venueLocation;
    cell3.textContent = quantity;
    cell4.innerHTML = `<img src="${imageURL}" alt="Venue Image" style="max-width: 100px;">`;
    cell5.innerHTML = '<button class="editBtn">Edit</button> <button class="deleteBtn">Delete</button>'; // Added delete button
  });
  
 // Event delegation to handle click events on edit and delete buttons
 venueTable.addEventListener("click", function(event) {
    if (event.target.classList.contains("editBtn")) {
      const row = event.target.closest("tr");
      const venueName = row.cells[0].textContent;
      const venueLocation = row.cells[1].textContent;
      const newVenueName = prompt("Edit Venue Name:", venueName);
      const newVenueLocation = prompt("Edit Venue Location:", venueLocation);
      row.cells[0].textContent = newVenueName;
      row.cells[1].textContent = newVenueLocation;
    }
    
    if (event.target.classList.contains("deleteBtn")) {
      const row = event.target.closest("tr");
      if (confirm("Are you sure you want to delete this venue?")) {
        row.remove();
      }
    }
  });

  viewReservations.addEventListener("click", function() {
    if (reservationTable.style.display === "none") {
      reservationTable.style.display = "block"; // Sbhow table
    } else {
      reservationTable.style.display = "none"; // Hide table
    }
  });
    
  });