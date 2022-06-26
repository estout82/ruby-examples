/**
 * matchers
 */

// expect returns an expectation object

test("two plus two is four", () => {
  // NOTE toBe checks Object.is
  expect(2 + 2).toBe(4);
});

test("object assignment", () => {
  const data = {one: 1}
  data['two'] = 2;

  // NOTE toEqual recursively checks every property of object for equality
  expect(data).toEqual({one: 1, two: 2});
});

test("null", () => {
  const n = null;

  expect(n).toBeNull();                   // true
  expect(n).toBeDefined();                // true
  expect(n).not.toBeUndefined();          // true
  expect(n).toBeFalsy();                  // true
  expect(n).not.toBeTruthy();             // true
});

test("numbers", () => {
  const n = 5;

  expect(n).toBeGreaterThan(4);           // true
  expect(n).toBeGreaterThanOrEqual(4);    // true
  expect(n).toBeLessThan(6);              // true
  expect(n).toBeLessThanOrEqual(5);       // true
  expect(n).toBe(5);                      // true
  expect(n).toEqual(5);                   // true
});

test("strings", () => {
  const s = "hey";
  const n = "6";

  expect(s).toMatch(/hey/);
  expect(s).not.toMatch(/bye/);
  expect(n).toEqual(6);                   // true
  expect(n).not.toStrictEqual(6);         // true
});

test("array & iterables", () => {
  const a = [1, 2, 3];

  expect(a).toContain(2);
  expect(a).not.toContain(5);
});

test("objects & classes", () => {
  class Foo {
    speak() {
      console.log("sup man");
    }
  }

  const object = {name: "jim"};
  const instance = new Foo();

  expect(object).toHaveProperty("name", "jim")
  expect(instance).toBeInstanceOf(instance);
});

const iThrow = () => {
  throw new Error("I am an error");
}

test("exceptions", () => {
  expect(() => iThrow()).toThrow();
  expect(() => iThrow()).toThrow(Error);

  // NOTE test message with regex
  expect(() => iThrow()).toThrow("I am an error");
  expect(() => iThrow()).toThrow(/error/);
});