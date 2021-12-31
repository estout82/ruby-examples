#!/bin/zsh

# bundle main.js (and deps), then output into ./build
esbuild main.js --bundle --outdir=./build

# file types
.js             # javascript
.css            # css
.jsx            # javascript with jsx (react)
.ts             # typescript

# flags
--watch                         # watch for changes
--minify                        # remove un-used stuff
--tree-shaking=true             # explicitly enable tree-shaking
--ts-config=./ts.config.js      # specify a tsconfig file

# NOTE: you can also use a 