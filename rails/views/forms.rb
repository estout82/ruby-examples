#!/usr/bin/env ruby

# arrays
<input type="textbox" name="course[track_codes][]", value="a">
<input type="textbox" name="course[track_codes][]", value="b">
<input type="textbox" name="course[track_codes][]", value="c">

{ course: { track_codes: ['a', 'b', 'c'] } }

# hash
<input type="textbox" name="course[track_codes][x]", value="a">
<input type="textbox" name="course[track_codes][y]", value="b">
<input type="textbox" name="course[track_codes][z]", value="c">
{ course: { track_codes: { x: 'a', y: 'b', z: 'c' } }