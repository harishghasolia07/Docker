const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  return res.json({ message: "NodeJS in Container" });
});

app.listen(PORT, () => {
  console.log(`Server is running on PORT: ${PORT}`);
});
