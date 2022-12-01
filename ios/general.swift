

@main                     // apply this to indicate the entry point of the program

/*
 * some keyword
 */

protocol Machine {}
struct Car : Machine {}
struct Plane : Machine {}

// Some here implies that this function returns something
// that complies to the Machine protocol. This is called an
// opaque return type
func foo() -> some Machine {
  return Car();
}

/*
 * final keyword
 */

// prevent this class from being subclassed
final class MyCoolClass {
  // you can't inherit from me
}

/*
 * guard keyword
 */

/*
 * enums
 */

enum Status {
  case Unauthorized = "You're not allowed to do that"
  case Unauthenticated = "We don't know who you are"
  case NotFound = "We don't know where that is"
  case BadRequest = "We don't know what you're talking about"
  case UnprocessableEntity = "That think you gave us doesn't look right"
}

/*
 * @escaping
 */

// When applied to a function (or closure) @escaping means that the function can
// outlive the scope of the block that it is passed into. Eg network calls. In
// simple terms, this means that the closure can outlive the block that encloses it.