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

visits = 0

def breadth_first_search(graph)
  __breadth_first_search_recurs graph, graph["you"], [], 0
end

def __breadth_first_search_recurs(graph, search, visited, visits)
  return puts "unable to find thom" if search.size < 1

  target = search.shift

  unless visited.include? target
    puts "searching #{target}"

    if target == "thom"
      puts "found thom in #{visits} visits"
      return
    end

    visits += 1

    search.concat graph[target]

    visited.push target
  else
    puts "skipping #{target} because it has already been visited"
  end

  __breadth_first_search_recurs graph, search, visited, visits
end

breadth_first_search graph