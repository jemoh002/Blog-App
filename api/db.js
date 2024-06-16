import mysql from "mysql";

const db = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "mysql",
  database: "blog",
});

db.connect((err) => {
  if (err) throw err;
  console.log("Connected to db");
});

export default db;
