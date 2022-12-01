// three types of closures
// - global functions
// - nested functions
// - closure expressions

// this is a function that takes a closure
func foo(bar: (x: Int, y: Int) -> Int) {
  print(bar(10, 20));
}

// proper syntax
foo(bar: { (a: Int, b: Int) -> Int in
  return a + b;
});

// trailing closure syntax
foo() { (a: Int, b: Int) -> Int in
  return a + b;
}

// trailing closure with type inference
foo() { a, b in
  return a + b;
}

// trailing closure with type inference and implicit return
foo() { a, b in a + b }
