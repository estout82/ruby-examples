
// Swift UI element things

View                              // can think of this as a JSX fragment maybe
NavigationView                    // view with a nav header?
TabView                           // bottom nav tabs
Text                              // duh
Image                             // an image
Image(systemName: "house")        // uses apple's built in sys icons
Color("brand")                    // pulls a named color from the assets

/*
 * modifiers
 */ 

.tabItem { ... }                  // adds a tab to the a tab view

@State                            // A property wrapper that allows you to read / write a value
                                  // - when the value changes, it recomputes the body appearance of
                                  // current component. Think useState from react

@StateObject                      // Like @state but with ObservableObjects
                                  // - when the object publishes a change, view is re-rendered

@Published                        // A property that should broadcast its changes

/*
 * Important classes
 * - NOTE these are UI Kit classes
 */

AppDelegate
// effective root of app
// - initialize app data structures
// - configure scenes
// - respond to external notification (sys events, etc..)
// - register any services at launch time (APNS) etc
// - more

NavigationController
// a container view controller that manages one or more child view controllers
// - only 1 view controller is shown at a time
// - push / pop on and off 'navigation' stack of view controllers

ViewController

UIScene
// a scene is an instance of your app's UI (eg multiple windows, etc..)
// UIKit creates an instance of 