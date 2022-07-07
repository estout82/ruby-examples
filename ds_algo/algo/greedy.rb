#!/usr/bin/env ruby

require "set"

needed = Set.new ["id", "nv", "ut", "wa", "mt", "or", "ca", "az"]

stations = {}
stations["kone"] = Set.new ["id", "nv", "ut"]
stations["ktwo"] = Set.new ["wa", "id", "mt"]
stations["kthree"] = Set.new ["or", "nv", "ca"]
stations["kfour"] = Set.new ["nv", "ut"]
stations["kfive"] = Set.new ["ca", "az"]

covered = Set.new
selected_stations = []

while covered.size < needed.size
  outstanding = needed - covered

  best_station_name = nil

  stations.each do |name, states|
    states_covered = outstanding & states

    if states_covered.size > 0
      best_station_name = if best_station_name != nil
        states_covered.size > stations[best_station_name].size ?
          name :
          best_station_name
      else
        name
      end
    end
  end

  if best_station_name != nil
    covered.merge stations[best_station_name]
    selected_stations << best_station_name
  else
    puts "unable to find a subset of stations that includes all states"
    exit
  end
end