export {}

declare global {
  namespace Express {
    export interface Request {
      apiId: string;
      json: object;
    }
  }
}
