/**
 * What is React Fiber?
 * 
 * Fiber is React's DOM (& shadow dom) reconciler.
 * - It's async: it can pause & resume, re-use previously completed work,
 *   prioritize different UI renders & changes, and abort work if it is
 *   no longer needed
 */


/**
 * App is a React Element
 * 
 * React Element: A plain object that describes the tree (DOM or otherwise)
 * - abstracts away the complexity of the actual DOM
 */
ReactDOM.render(<App />, document.getElementById('root'));

/**
 * Reconciliation
 * 
 * The process of traversing all react elements in the tree to to get their
 * corresponding DOM elements based on the current state & props.
 */