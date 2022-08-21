/**
 * keyboard events
 */

event.key                             // returns name of key pressed (eg ArrowUp or d)
event.metaKey                         // true if command (or windows) was pressed at the time of the event
event.shiftKey                        // true if shift key was pressed
event.ctrlKey                         // true if control key was pressed

/**
 * iOS will only allow focus to be triggered on other elements, from within
 * a function, if the first function in the call stack was triggered by a
 * non-programmatic event.
 */
