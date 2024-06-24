const express = require("express");
const router = express.Router();
const mysql = require("../mysql").pool;

// PESQUISAR REAÇÃO POR ID
router.get("/:id", (req, res, next) => {
  const { id} = req.params;

  mysql.getConnection((err, conn) => {
    if (err) return res.status(500).send({ error: err });

    const query = 'SELECT * FROM reacao WHERE cod_usuario =?';
    conn.query(query, [id], (err, results) => {
      conn.release();
      if (err) return res.status(500).send({ error: err });

      if (results.length === 0) {
        return res.status(404).send({ mensagem: "Reação não encontrada" });
      }

      res.status(200).send({ reacao: results });
    });
  });
});




router.post("/", (req, res, next) => {
  const { id_foto, id_usuario } = req.body;
 console.log(req.body)
  mysql.getConnection((err, conn) => {
    if (err) return res.status(500).send({ error: err });

    const query_like = 'SELECT count(*) as total FROM REACAO WHERE cod_usuario = ? AND cod_foto = ?';
    conn.query(query_like, [id_usuario, id_foto], (err, rows) => {
      if (err) {
        conn.release();
        return res.status(500).send({ error: err });
      }






      if (rows[0].total > 0) {
        const query = 'DELETE FROM reacao WHERE cod_foto = ? AND cod_usuario = ?';
        conn.query(query, [id_foto, id_usuario], (err, results) => {
          if (err) {

            conn.release();
            return res.status(500).send({ error: err });
          }


          
          conn.release();
          if (results.affectedRows === 0) return res.status(404).send({ mensagem: "Reação não encontrada" });





          res.status(201).send({ mensagem: "Curtida removida com sucesso!" });
        });
      } else {
        const query = 'INSERT INTO reacao (cod_foto, cod_usuario) VALUES (?, ?, CURDATE())';
        conn.query(query, [id_foto, id_usuario], (err, results) => {
          if (err) {
            conn.release();
            return res.status(500).send({ error: err });
          }


          
          conn.release();
          res.status(201).send({ mensagem: "Curtidas salvadas com sucesso!", cod_reacao: results.insertId });
        });
      }
    });
  });
});






module.exports = router;
