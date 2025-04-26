const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const app = express();
app.use(express.json());
app.use(cors()); // To prevent CORS issues

// Database Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Rithvik@2025',
  database: 'eventease'
});

db.connect((err) => {
  if (err) {
    console.error('Database connection failed:', err.message);
  } else {
    console.log('Connected to MySQL Database');
  }
});

// Test Route
app.get('/', (req, res) => {
  res.send('Server is running...');
});

// Fetch Events
// Fetch events by club
app.get('/events/:club', (req, res) => {
  const { club } = req.params;  // Extract the club name from URL params
  const tableName = `${club}Events`;  // Dynamically set the table name based on the club

  const sql = `SELECT * FROM \`${tableName}\` ORDER BY EventDate ASC`;  // Query to fetch events ordered by EventDate

  db.query(sql, (err, results) => {  // Execute the query
    if (err) {
      console.error(`Database error for table ${tableName}:`, err.message);  // Log any errors
      return res.status(500).json({ error: err.message });  // Respond with a 500 error if there is a database issue
    }
    res.json(results);  // Return the results as JSON
  });
});


// Fetch a specific event by EventID
app.get('/event/:id', (req, res) => {
  const { id } = req.params;
  const tableName = 'VitarkaEvents'; // Ensure the correct table is used

  const sql = `SELECT * FROM ${tableName} WHERE EventID = ?`;

  db.query(sql, [id], (err, results) => {
    if (err) {
      console.error('Database error:', err.message);
      return res.status(500).json({ error: err.message });
    }
    if (results.length === 0) {
      return res.status(404).json({ error: 'Event not found' });
    }
    res.json(results[0]);
  });
});

// Add New Event (Admin Side)
app.post('/events/:club', (req, res) => {
  const { club } = req.params;
  const tableName = `${club}Events`;

  console.log("Received request for club:", club);
  console.log("Trying to insert into table:", tableName);
  console.log("Received Data:", req.body); // ✅ Log the request body

  const { EventName, Description, EventDate, StartTime, EndTime, Location, TotalSeats, AvailableSeats, OrganizerID } = req.body;

  if (!EventName || !EventDate || !Location || !StartTime || !EndTime || !TotalSeats || !AvailableSeats || !OrganizerID) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  const sql = `
    INSERT INTO \`${tableName}\` (EventName, Description, EventDate, StartTime, EndTime, Location, TotalSeats, AvailableSeats, OrganizerID) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [EventName, Description, EventDate, StartTime, EndTime, Location, TotalSeats, AvailableSeats, OrganizerID], (err) => {
    if (err) {
      console.error(`Error adding event to ${tableName}:`, err.message);
      return res.status(500).json({ error: `Error adding event for ${club}: ${err.message}` });
    }
    res.status(201).json({ message: `Event added successfully to ${club} events!` });
  });
});




app.put('/events/:id', (req, res) => {
  const { id } = req.params;
  const { EventName, Description, EventDate, Location, AvailableSeats, TotalSeats } = req.body;

  // Validate input
  if (!EventName || !EventDate || !Location || isNaN(AvailableSeats) || isNaN(TotalSeats)) {
    return res.status(400).json({ error: "Invalid data. Please check your inputs." });
  }

  const sql = `
    UPDATE VitarkaEvents
    SET EventName = ?, Description = ?, EventDate = ?, Location = ?, AvailableSeats = ?, TotalSeats = ?
    WHERE EventID = ?
  `;

  const values = [EventName, Description, EventDate, Location, AvailableSeats, TotalSeats, id];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error("Error updating event:", err);
      return res.status(500).json({ error: err.message });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Event not found." });
    }
    res.json({ message: "Event updated successfully." });
  });
});


// Delete an event
app.delete('/events/:clubName/:eventId', (req, res) => {
  const { clubName, eventId } = req.params;

  console.log("🔹 Received DELETE request:", { clubName, eventId });

  if (!eventId || isNaN(eventId)) {
      console.error("❌ Invalid Event ID:", eventId);
      return res.status(400).json({ error: "Valid Event ID is required" });
  }

  const tableName = `${clubName}Events`; // Ensure correct table naming
  const sql = `DELETE FROM ?? WHERE EventID = ?`;

  console.log("🔹 Executing SQL:", sql, [tableName, eventId]);

  db.query(sql, [tableName, eventId], (err, result) => {
      if (err) {
          console.error("❌ SQL Error:", err.message);
          return res.status(500).json({ error: "Error deleting event", details: err.message });
      }

      if (result.affectedRows === 0) {
          console.log("❌ Event not found in table:", tableName);
          return res.status(404).json({ error: "Event not found" });
      }

      console.log("✅ Event deleted successfully from table:", tableName);
      res.json({ message: "✅ Event deleted successfully!" });
  });
});













// Route for Registration
// Route for Registration (Change to /registrations/Vitarka)
// Middleware to parse JSON bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// Route to fetch events for a specific club (e.g., Vitarka)
app.get('/events/:club', (req, res) => {
  const { club } = req.params;
  const tableName = `${club}Events`;

  const sql = `SELECT * FROM \`${tableName}\` ORDER BY EventDate ASC`;

  db.query(sql, (err, results) => {
    if (err) {
      console.error(`Error fetching events for table ${tableName}:`, err.message);
      return res.status(500).json({ error: 'Database error' });
    }
    res.json(results);
  });
});



// Route for Registration
app.post('/registrations/:club', (req, res) => {
  const { club } = req.params;
  const tableName = `${club}Registrations`;

  console.log("✅ Received request for club:", club);
  console.log("📥 Received Data:", req.body); // Log all received data

  const { FullName, StudentID, Email, Phone_Number, Department, Section, Year, EventID, EventName } = req.body;

  if (!FullName || !StudentID || !Email || !Phone_Number || !Department || !Section || !Year || !EventID || !EventName) {
      console.error("❌ Missing required fields:", { FullName, StudentID, Email, Phone_Number, Department, Section, Year, EventID, EventName });
      return res.status(400).json({ error: "All fields are required!" });
  }

  const sql = `
      INSERT INTO \`${tableName}\` (EventID, Email, FullName, Phone_Number, Department, Year, Section, EventName, StudentID) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [EventID, Email, FullName, Phone_Number, Department, Year, Section, EventName, StudentID], (err) => {
      if (err) {
          console.error(`❌ Error inserting data:`, err.message);
          return res.status(500).json({ error: `Error inserting data: ${err.message}` });
      }
      res.status(201).json({ message: "✅ Registration successful!" });
  });
});


//for viewing registrations
app.get('/registrations/:clubName', (req, res) => {
  const clubName = req.params.clubName; 
  const tableName = `${clubName.toLowerCase()}registrations`;  // Example: vitarkaregistrations

  const sql = `SELECT StudentID, FullName, Department, Year, Section, Email, Phone_Number, EventID, EventName FROM ${tableName}`;

  db.query(sql, (err, results) => {
      if (err) {
          console.error("Error fetching registrations:", err.message);
          return res.status(500).json({ error: "Error fetching registrations" });
      }
      res.json(results);
  });
});










// Use the dynamic port from the environment or fallback to 3000
const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});


app.post('/registrations/:clubName', async (req, res) => {
  const { clubName } = req.params;
  const {
    StudentID, FullName, Department, Year,
    Section, Email, Phone_Number, EventID, EventName
  } = req.body;

  // Dynamically build table names
  const registrationsTable = `${clubName.toLowerCase()}registrations`;
  const notificationsTable = `${clubName.toLowerCase()}notifications`;

  try {
    // 1. Insert into dynamic registrations table
    await db.query(`
      INSERT INTO ${registrationsTable}
      (StudentID, FullName, Department, Year, Section, Email, Phone_Number, EventID, EventName)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [StudentID, FullName, Department, Year, Section, Email, Phone_Number, EventID, EventName]
    );

    // 2. Insert into dynamic notifications table
    const message = `🎉 Hi ${FullName}, your registration for "${EventName}" is confirmed!`;
    await db.query(`
      INSERT INTO ${notificationsTable}
      (StudentID, Email, Message)
      VALUES (?, ?, ?)`,
      [StudentID, Email, message]
    );

    // 3. Send confirmation email
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'rithvikaavula42@gmail.com',
        pass: 'pdvc tykm ypgx tbpq' // replace with secure App Password
      }
    });

    const mailOptions = {
      from: 'rithvikaavula42@gmail.com',
      to: Email,
      subject: `Confirmation for ${EventName}`,
      html: `
        <p>Hi ${FullName},</p>
        <p>You have successfully registered for <strong>${EventName}</strong> conducted by <strong>${clubName}</strong>.</p>
        <p>We look forward to seeing you at the event!</p>
      `
    };

    transporter.sendMail(mailOptions, (emailErr, info) => {
      if (emailErr) {
        console.error("📧 Email error:", emailErr);
      } else {
        console.log("📧 Email sent:", info.response);
      }
    });

    // 4. Respond to frontend
    res.status(200).json({ message: 'Registration and email successful' });

  } catch (err) {
    console.error("❌ Registration failed:", err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// LOGIN ROUTE
app.post("/login", (req, res) => {
  const { username, password } = req.body;

  const sql = "SELECT * FROM users WHERE username = ? AND password = ?";
  db.query(sql, [username, password], (err, result) => {
    if (err) return res.json({ success: false, message: "Database error" });

    if (result.length > 0) {
      const user = result[0];
      if (user.role === "admin") {
        return res.json({
          success: true,
          role: "admin",
          redirect: `admin${user.username.slice(-1)}.html` // Example: admin1.html
        });
      } else {
        return res.json({ success: true, role: "student" });
      }
    } else {
      return res.json({ success: false, message: "Invalid credentials" });
    }
  });
});

// SIGNUP ROUTE
app.post("/signup", (req, res) => {
  const { username, email, password, role } = req.body;

  const checkUser = "SELECT * FROM users WHERE username = ?";
  db.query(checkUser, [username], (err, result) => {
    if (err) return res.json({ success: false, message: "Database error" });

    if (result.length > 0) {
      return res.json({ success: false, message: "Username already exists" });
    }

    const insertUser = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
    db.query(insertUser, [username, email, password, role], (err2) => {
      if (err2) return res.json({ success: false, message: "Database insert error" });
      return res.json({ success: true });
    });
  });
});