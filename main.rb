require './lib/graph'
require './lib/path_measurer'

edges = []

$stdin.each_line do | line |
	line.strip!
	edges.concat line.split(/\s|,\s|,/)
end


graph = Graph.new
path_measurer = PathMeasurer.new(graph)

edges.each do | edge |
	graph.add_edge(edge[0], edge[1], edge[2..-1].to_i)
end


# 1. The distance of the route A-B-C.
puts path_measurer.distance(['A', 'B', 'C'])

# 2. The distance of the route A-D.
puts path_measurer.distance(['A', 'D'])

# 3. The distance of the route A-D-C.
puts path_measurer.distance(['A', 'D', 'C'])

# 4. The distance of the route A-E-B-C-D.
puts path_measurer.distance(['A', 'E', 'B', 'C', 'D'])

# 5. The distance of the route A-E-D.
puts path_measurer.distance(['A', 'E', 'D'])

# 6. The number of trips starting at C and ending at
# C with a maximum of 3 stops.
puts graph.num_trips('C', 'C', 3, Graph::MaxStops)

# 7. The number of trips starting at A and ending at
# C with exactly 4 stops.
puts graph.num_trips('A', 'C', 4, Graph::ExactStops)

# 8. The length of the shortest route (in terms of
# distance to travel) from A to C.
puts graph.shortest_path('A', 'C')

# 9. The length of the shortest route (in terms of
# distance to travel) from B to B.
puts graph.shortest_path('B', 'B')

# 10. The number of different routes from C to C with
# a distance of less than 30.
puts graph.num_trips('C', 'C', 30, Graph::MaxDistance)
