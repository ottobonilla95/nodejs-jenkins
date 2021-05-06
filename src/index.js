const express = require("express");

const PORT = 3000;
const app = express();

app.get("/test", (req, res) => {
  res.send({ message: "welcome2" });
});

app.listen(PORT, () => {npm
  console.log(`App up and runing on port ${PORT}.`);
});
