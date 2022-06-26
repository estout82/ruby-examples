#!/usr/bin/env ruby

graph = {}

graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

search_queue = []
search_queue.concat graph["you"]

visits = 0

visited = []

while search_queue.size > 0
  target = search_queue.shift

  unless visited.include? target
    puts "visiting node #{target}"

    if target == "thom"
      puts "found thom after #{visits} visits"
      break
    end

    visited.push target

    # node is not the target node, add all their neighbors
    search_queue.concat graph[target]

    visits += 1
  end
end