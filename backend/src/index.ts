import express, { NextFunction, Request, Response } from "express";
import cors from "cors";
import { v4 as uuidv4 } from 'uuid';

const app = express();
app.use(cors())
app.use(express.json());
const port = +(process.env.PORT ?? 8000);

const database: Database = {
  games: {},
  locations: {},
  names: {},
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
  const apiId = (data.id as apiId || null || undefined) ?? null;
  if (!apiId) {
    return res.status(401).send("You have not specified an API ID");
  }
  const gameCode = (data.gameCode as gameCode || undefined || null) ?? null;
  const json = JSON.parse((data.json as string || undefined || null) ?? "{}");
  req.apiId = apiId;
  req.json = json;
  req.gameCode = gameCode;
  next();
});

const requireGameExists = (req: Request, res: Response, next: NextFunction) => {
  if (req.gameCode == null) {
    return res.status(401).send("You have not joined a game");
  }
  
  const game = database.games[req.gameCode];

  if (!game) {
    return res.status(400).send(`The game with code ${req.gameCode} does not exist`);
  }

  req.game = game;

  next();
}

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

app.post("/join-game", requireGameExists, (req, res) => {
  if (!req.game!.participants.includes(req.apiId)) {
    req.game!.participants.push(req.apiId);
  }
  res.json({});
});


app.post("/quit-game", requireGameExists, (req, res) => {
  if (req.game!.participants.includes(req.apiId)) {
    req.game!.participants = req.game!.participants.filter(x => x != req.apiId);
  }
  delete database.locations[req.apiId]
  delete database.names[req.apiId]
  res.json({});

})

// Returns a string containing characters between `lower` and `upper` (inclusive of both ends)
// E.g. rangeBetweenChars("A", "D") ----> "ABCD"
function rangeBetweenChars(lower: string, upper: string): string[] {
  return String.fromCharCode(...[...Array(upper.charCodeAt(0) - lower.charCodeAt(0) + 1).keys()].map(i => i + lower.charCodeAt(0))).split("");
}

function generateRandomGameId(length: number = 5): string {
  const bannedChars = ["0", "O", "I", "1"];
  const allowedChars = [...rangeBetweenChars("A", "Z"), ...rangeBetweenChars("0", "9")].filter(
    x => !bannedChars.includes(x)
  );
  let code = "";
  for (let i=0; i<length; i++) {
    const idx = Math.floor(Math.random() * allowedChars.length);
    code += allowedChars[idx];
  }
  return code;
}

app.post("/create-game", (req, res) => {
  let gameCode: string;
  do {
    gameCode = generateRandomGameId();
  } while (!!database.games[gameCode]);
  database.games[gameCode] = {
    admin: req.apiId,
    participants: [req.apiId],
  };
  res.json({ gameCode });
});


app.get("/everyones-locations", requireGameExists, (req, res) => {
  const results: ({ name: string, apiId: string } & Location)[] = [];
  for (const apiId of req.game!.participants) {
    if (!database.locations[apiId]) {
      continue;
    }
    results.push({ name: database.names[apiId] ?? "<No Name>", apiId, ...database.locations[apiId] });
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