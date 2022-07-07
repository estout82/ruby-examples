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
  search = graph["you"].map { |node| {node: node, level: 1} }

  __breadth_first_search_recurs graph, search, [], 0
end

def __breadth_first_search_recurs(graph, search, visited, visits)
  return puts "unable to find thom" if search.size < 1

  target = search.shift

  unless visited.include? target[:node]
    puts "searching #{target}"

    if target[:node] == "thom"
      puts "found thom in #{target[:level]} levels #{visits} visits"
      return
    end


    visits += 1
    search.concat graph[target[:node]].map { |node| {node: node, level: target[:level] + 1} }

    visited.push target[:node]
  else
    puts "skipping #{target[:node]} because it has already been visited"
  end

  __breadth_first_search_recurs graph, search, visited, visits
end

breadth_first_search graph