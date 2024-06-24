const express = require("express");
const router = express.Router();
const mysql = require("../mysql").pool;


router.post("/", (req, res, next) => {
  const {email,senha}= req.body;
  mysql.getConnection((err, conn) => {
    if (err) return res.status(500).send({ error: err });



    const query = 'SELECT * FROM usuarios WHERE email = ? AND senha = ?';
    conn.query(query, [email, senha], (err, results) => {
      conn.release();
      if (err) return res.status(500).send({ error: err });





      if (results.length === 0) return res.status(401).send({ mensagem: "Falha na autenticação" });





      res.status(200).send({ mensagem: "usuario salvado com sucesso", usuario: results[0] });
    });
  });
});



module.exports = router;
