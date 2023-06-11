import express from "express";

const app = express();
app.use(express.json());
const port = +(process.env.PORT ?? 8000);

interface Location {
  lat: number;
  lng: number;
}

interface Database {

  locations: {[key: string]: Location}
  names: {[key: string]: string}

}

const database: Database = {
  locations: {},
  names: {}
};

app.post("/my-location", (req, res) => {
  const apiId = req.query.api_id as string;
  const data = JSON.parse(req.body.data as string) as Location;
  database.locations[apiId] = data;
  res.json({});
});

app.post("/my-name", (req, res) => {
  const apiId = req.body.api_id as string;
  console.log(apiId);
  const data = JSON.parse(req.body.data as string) as {name: string};
  database.names[apiId] = data.name;
  res.json({});
});


app.get("/everyones-locations", (req, res) => {
  const results: ({name: string, apiId: string} & Location)[] = [];
  for (const apiId in database.names) {
    if (!!database.locations[apiId]) {
      continue;
    }
    results.push({name: database.names[apiId], apiId, ...database.locations[apiId]});
  }
  res.json({results});
});

app.get("/heart", (req, res) => {
  const apiId = req.query.api_id;
  console.log(`User ${apiId} sent a heartbeat`);
  res.json({beat: true});
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});