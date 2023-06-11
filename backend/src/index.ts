import express from "express";

const app = express();
const port = +(process.env.PORT ?? 8000);

app.get("/heart", (req, res) => {
  res.send("beat");
})

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
})