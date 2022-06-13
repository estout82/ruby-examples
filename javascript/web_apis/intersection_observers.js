let options = {
  root: document.querySelector("#scrollArea"),    // the element to check target's visibility against
  rootMargin: "10px 20px 30px 40px",              // amount to 'shrink' root's viewport before performing calculations
  threshold: [0, .5, 1]                           // a num (between 0 & 1) that determines when to run the callback. can be single value or array
                                                  // this value would run callback when (each time) target has 1px visible (0), half visible or fully visible
}

const observer = new IntersectionObserver(callback, options);

// observe a target element
observer.observe(target);