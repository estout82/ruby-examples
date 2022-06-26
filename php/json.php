<?php

$str = "{ \\\"key\\\": 10 }";   // { \"key\": 10 }
$other_str = "{ \"key\": 10 }"; // { "key": 10 }

$unescaped = stripslashes($str);
$obj = json_decode($unescaped);

print_r($obj);