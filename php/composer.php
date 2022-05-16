<?php

/**
 * Packagist      - web service that hosts packages (think npm)
 * composer.json  - like package.json with npm
 */

"composer require phpunit/php-timer" // this requires a package and generates composer.json file

// add this to composer.json to ensure that your host version of php and package version can co-exist
{
  "config": {
    "platform": {
      "php": "7.4.1"
    }
  }
}