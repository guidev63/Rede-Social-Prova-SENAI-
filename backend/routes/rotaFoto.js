const express = require("express");
const router = express.Router();
const mysql = require("../mysql").pool;


router.get("/:cod", (req, res, next) => {
  const cod = req.params.cod;

  mysql.getConnection((err, conn) => {
    if (err) return res.status(500).send({ error: err });

    const query = 'SELECT * FROM foto WHERE Cod = ?';
    conn.query(query, [cod], (err, results) => {
      conn.release();
      if (err) return res.status(500).send({ error: err });

      if (results.length === 0) return res.status(404).send({ mensagem: "Fotos não encontradas" });

      res.status(200).send({ foto: results[0] });
    });
  });
});


router.get("/", (req, res, next) => {
  mysql.getConnection((err, conn) => {

    if (err) return res.status(500).send({ error: err });

    const query = `
      SELECT 
        Cod, cod_usuario, nomefoto,
        (SELECT COUNT(*) FROM reacao WHERE reacao.cod_foto = foto.Cod) AS totalreacao,
        (SELECT COUNT(*) FROM comentario WHERE comentario.cod_foto = foto.Cod) AS totalcomentario 
      FROM foto;
    `;




    conn.query(query, (err, results) => {
      conn.release();
      if (err) return res.status(500).send({ error: err });

      res.status(200).send({ fotos: results });
    });
  });
});

module.exports = router;