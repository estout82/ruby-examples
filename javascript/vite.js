/**
 * setup / config
 * 
 * NOTE vitest.config.ts is the config file for vitest
 */

 import {defineConfig} from 'vite'

 export default defineConfig({
   // put all test config under test key
   test: {
    // use this for browser code
    // - has thing like fetch and document defined
    environment: 'happy-dom',

    // use this for node tests
    environment: 'node',

    // path to setup files
    setupFiles: [
      "some/path/file.js"
    ]
   }
 });

/**
 * import mocking
 */

/**
 * request mocking
 * 
 * NOTE mocking is done with mock service worker to intercept requests
 * - msw/node
 */

