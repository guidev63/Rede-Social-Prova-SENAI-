const express = require("express");
const router = express.Router();
const mysql = require("../mysql").pool;

router.get("/:cod", (req, res, next) => {



  const cod = req.params.cod;
  mysql.getConnection((err, conn) => {
    if (err) return res.status(500).send({ error: err });

    const query = 'SELECT * FROM comentario WHERE cod_foto = ?';
    conn.query(query, [cod], (err, results) => {
      conn.release();
      if (err) return res.status(500).send({ error: err });

      if (results.length === 0) return res.status(404).send({ mensagem: "Comentario não encontrado" });

      res.status(200).send({ comentario: results[0] });
    });
  });
});




router.post("/", (req, res, next) => {
  const {idfoto, id , textcomentario} = req.body;

  mysql.getConnection((err, conn) => {
    if (err) return res.status(500).send({ error: err });

    const query = 'INSERT INTO comentario (cod_foto, cod_usuario, texto_comentario) VALUES (?, ?, ?)';
    conn.query(query, [idfoto, id, textcomentario], (err, results) => {
      conn.release();
      if (err) return res.status(500).send({ error: err });

      res.status(201).send({ mensagem: "Comentario salvo com sucesso!", cod_comentario: results.insertId });
    });
  });
});




module.exports = router;
