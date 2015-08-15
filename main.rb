require './lib/graph'
require './lib/path_measurer'
require './lib/path_searcher'
require './lib/path_explorer'
require './lib/exact_path_length_checker'
require './lib/max_path_distance_checker'
require './lib/max_path_length_checker'

edges = []

$stdin.each_line do | line |
	line.strip!
	edges.concat line.split(/\s|,\s|,/)
end


graph = Graph.new

path_measurer = PathMeasurer.new(graph)

path_searcher = PathSearcher.new(graph)

exact_path_length_checker = ExactPathLengthChecker.new(graph, 4)
max_path_length_checker = MaxPathLengthChecker.new(graph, 3)
max_path_distance_checker = MaxPathDistanceChecker.new(graph, 30)

exact_path_length_path_explorer = PathExplorer.new(graph, exact_path_length_checker)
max_path_length_path_explorer = PathExplorer.new(graph, max_path_length_checker)
max_path_distance_path_explorer = PathExplorer.new(graph, max_path_distance_checker)

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
#
# 6. The number of trips starting at C and ending at
# C with a maximum of 3 stops.
puts 'Output #6: ' + max_path_length_path_explorer.explore('C', 'C').count.to_s

# 7. The number of trips starting at A and ending at
# C with exactly 4 stops.
puts 'Output #7: ' + exact_path_length_path_explorer.explore('A', 'C').count.to_s

# 8. The length of the shortest route (in terms of
# distance to travel) from A to C.
puts 'Output #8: ' + path_searcher.shortest_path('A', 'C').to_s

# 9. The length of the shortest route (in terms of
# distance to travel) from B to B.
puts 'Output #9: ' + path_searcher.shortest_path('B', 'B').to_s

# 10. The number of different routes from C to C with
# a distance of less than 30.
puts 'Output #10: ' + max_path_distance_path_explorer.explore('C', 'C').count.to_s
