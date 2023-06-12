export { };

declare global {


  type apiId = string;
  type gameCode = string;

  interface Location {
    lat: number;
    lng: number;
  }

  interface GameData {

    participants: apiId[];
    admin: apiId;

  }

  interface Database {

    games: { [key: gameCode]: GameData };
    locations: { [key: apiId]: Location };
    names: { [key: apiId]: string };

  }

};