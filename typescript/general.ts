
interface User {
  name: string;
  id: number;
}

const user: User = {
  name: "ben",
  id: 100
}

class UserAccount {
  name: string
  id: number

  constructor(name: string, id: number) {
    this.name = name;
    this.id = id;
  }
}

const account = new UserAccount(user.name, user.id);

/**
 * unions
 */

type Status = "open" | "closed" | "deleted";

function getLength(obj: string | string[]) {
  return obj.length;
}

/**
 * type assertions
 * - specify a more specific type
 * - like annotations, these are stripped at run time
 */

const myCanvas = document.getElementById("the-canvas") as HTMLCanvasElement;