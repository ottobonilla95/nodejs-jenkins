const express = require("express");

const PORT = 3000;
const app = express();

app.get("/test", (req, res) => {
  res.send({ message: "welcome, with jenkins FINALLLLLL with port !" });
});

app.listen(PORT, () => {
  console.log(`App up and runing on port ${PORT}.`);
});
