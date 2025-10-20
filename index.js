const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');
require('dotenv').config();

// create a MySQL connection pool
const pool = mysql.createPool({
  connectionLimit: 10,
  host: process.env.DB_HOST || 'ahcr_mysql',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'ahcr'
});

// Create a new Express app
const app = express();
app.use(cors()); // Enable CORS
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Define your API endpoint for all 3 tables
app.get('/ahcr', (req, res) => {
  const results = {};
  
  pool.query('SELECT * FROM menu', (err1, menuResults) => {
    if (err1) {
      console.error(err1);
      return res.status(500).send('Error fetching menu');
    }
    results.menu = menuResults;

    pool.query('SELECT * FROM orders', (err2, ordersResults) => {
      if (err2) {
        console.error(err2);
        return res.status(500).send('Error fetching orders');
      }
      results.orders = ordersResults;

      pool.query('SELECT * FROM users', (err3, usersResults) => {
        if (err3) {
          console.error(err3);
          return res.status(500).send('Error fetching users');
        }
        results.users = usersResults;

        // Return JSON with all 3 tables
        res.json(results);
      });
    });
  });
});

// start the server
const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
