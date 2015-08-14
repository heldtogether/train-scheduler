require './lib/graph'
require './lib/path_measurer'
require './lib/path_searcher'
require './lib/path_explorer'

edges = []

$stdin.each_line do | line |
	line.strip!
	edges.concat line.split(/\s|,\s|,/)
end


graph = Graph.new
path_measurer = PathMeasurer.new(graph)
path_searcher = PathSearcher.new(graph)
path_explorer = PathExplorer.new(graph)

edges.each do | edge |
	graph.add_edge(edge[0], edge[1], edge[2..-1].to_i)
end


# 1. The distance of the route A-B-C.
puts 'Output #1: ' + path_measurer.distance(['A', 'B', 'C']).to_s

# 2. The distance of the route A-D.
puts 'Output #2: ' + path_measurer.distance(['A', 'D']).to_s

# 3. The distance of the route A-D-C.
puts 'Output #3: ' + path_measurer.distance(['A', 'D', 'C']).to_s

# 4. The distance of the route A-E-B-C-D.
puts 'Output #4: ' + path_measurer.distance(['A', 'E', 'B', 'C', 'D']).to_s

# 5. The distance of the route A-E-D.
puts 'Output #5: ' + path_measurer.distance(['A', 'E', 'D']).to_s

# 6. The number of trips starting at C and ending at
# C with a maximum of 3 stops.
puts 'Output #6: ' + path_explorer.num_trips('C', 'C', 3, Graph::MaxStops).to_s

# 7. The number of trips starting at A and ending at
# C with exactly 4 stops.
puts 'Output #7: ' + path_explorer.num_trips('A', 'C', 4, Graph::ExactStops).to_s

# 8. The length of the shortest route (in terms of
# distance to travel) from A to C.
puts 'Output #8: ' + path_searcher.shortest_path('A', 'C').to_s

# 9. The length of the shortest route (in terms of
# distance to travel) from B to B.
puts 'Output #9: ' + path_searcher.shortest_path('B', 'B').to_s

# 10. The number of different routes from C to C with
# a distance of less than 30.
puts 'Output #10: ' + path_explorer.num_trips('C', 'C', 30, Graph::MaxDistance).to_s
