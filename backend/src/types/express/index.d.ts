export {}

declare global {
  namespace Express {
    export interface Request {
      apiId: apiId;
      game: GameData?;
      gameCode: gameCode?;
      json: object;
    }
  }
}
