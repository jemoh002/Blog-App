import db from "../db.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

export const register = async (req, res) => {
  //CHECK EXISTING USER
  console.log("It hit the route");
  const { password } = req.body;

  const q = "SELECT * FROM users WHERE email=? OR username = ?";
  db.query(q, [req.body.email, req.body.name], (err, data) => {
    if (err) return res.json(err);
    if (data.length) return res.status(409).json("User already exists!");

    //   HASH THE PASSWORD AND CREATE A USER
    const salt = bcrypt.genSalt(10);
    const hash = bcrypt.hashSync(password, 10);

    const q =
      "INSERT INTO users(`username`, `email`, `password`) VALUES (?, ?, ?)";
    const values = [req.body.username, req.body.email, hash];

    db.query(q, values, (err, data) => {
      if (err) return res.status(401).json(err);
      return res.status(200).json("User has been created");
    });
  });
};

export const login = async (req, res) => {
  console.log(req.body);
  // CHECK USER
  const q = "SELECT * FROM users WHERE username=?";

  db.query(q, [req.body.username], (err, data) => {
    if (err) return res.json(err);
    if (data.length === 0) return res.status(404).json("User not found!");

    // CHECK password
    const isPasswordCorrect = bcrypt.compareSync(
      req.body.password,
      data[0].password
    );

    if (!isPasswordCorrect)
      return res.status(400).json("Wrong username or password");

    const token = jwt.sign({ id: data[0].id }, "jwtkey");
    const { password, ...other } = data[0];

    res
      .cookie("access_token", token, { httpOnly: true })
      .status(200)
      .json(other);
  });
};

export const logout = (req, res) => {};
