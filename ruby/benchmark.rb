#
# time
#

require "benchmark"

# NOTE: 25 is label length
Benchmark.bm 25 do |benchmark|

  # report how long 10*10 takes
  benchmark.report "ten times ten" { 10 * 10 }
end

#
# memory
#

# NOTE: gem "benchmark-memory"

Benchmark.memory do |benchmark|
  benchmark.report { do_something }
end