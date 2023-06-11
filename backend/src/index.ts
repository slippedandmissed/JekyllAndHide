import express, { Request } from "express";
import cors from "cors";

const app = express();
app.use(cors())
app.use(express.json());
const port = +(process.env.PORT ?? 8000);

interface Location {
  lat: number;
  lng: number;
}

interface Database {

  locations: { [key: string]: Location }
  names: { [key: string]: string }

}

const database: Database = {
  locations: {},
  names: {}
};


app.use((req: Request, res, next) => {
  let data;
  switch (req.method) {
    case "GET":
      data = req.query;
      break;
    case "POST":
      data = req.body;
      break;
    default:
      throw `Unsupported request method: ${req.method}`;
  }
  const apiId = data.id as string;
  const json = JSON.parse(data.json as string);
  req.apiId = apiId;
  req.json = json;
  next();
});

app.post("/my-location", (req, res) => {
  const data = req.json as Location;
  database.locations[req.apiId] = data;
  res.json({});
});

app.post("/my-name", (req, res) => {
  const data = req.json as { name: string };
  database.names[req.apiId] = data.name;
  res.json({});
});


app.get("/everyones-locations", (req, res) => {
  const results: ({ name: string, apiId: string } & Location)[] = [];
  for (const apiId in database.names) {
    if (!database.locations[apiId]) {
      continue;
    }
    results.push({ name: database.names[apiId], apiId, ...database.locations[apiId] });
  }
  res.json({ results });
});

app.get("/heart", (req, res) => {
  const apiId = req.query.api_id;
  console.log(`User ${apiId} sent a heartbeat`);
  res.json({ beat: true });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});