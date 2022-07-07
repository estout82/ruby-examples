/**
 * BAD seems like esbuild short circuits with circular dependencies
 */

// lodash

import * as lodash from "lodash";

lodash.range(0, 5);                             // creates an array with elements [0, 1, 2, 3, 4] (end is exclusive)