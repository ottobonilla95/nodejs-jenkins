const express = require("express");

const PORT = 3005;
const app = express();

app.get("/test", (req, res) => {
  res.send({ message: "welcome, with jenkins FINALLLLLL!" });
});

app.listen(PORT, () => {
  console.log(`App up and runing on port ${PORT}.`);
});
