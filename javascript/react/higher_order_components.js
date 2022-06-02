/**
 * higher order components basically wrap react components
 * - eg a function that takes in a component as an argument and returns a new component
 */

function logProps(Component) {
  return function(props) {
    console.log(props);

    return <Component {...props} />;
  }
}

const LoggableComponent = logProps(SomeComponent);

// NOTE enhanced component
<LoggableComponent />