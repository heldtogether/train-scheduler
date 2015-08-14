require_relative 'graph'

class PathExplorer

	MaxStops = 1
	ExactStops = 2
	MaxDistance = 4

	def initialize (graph)

		@graph = graph

	end

	def num_trips(tail, head, limit = nil, limit_type = MaxStops)

		trips = 0
		trip_stops = 0
		trip_distances = []

		next_frontier = [tail]
		new_distances = {tail => 0}

		while ! next_frontier.empty?

			frontier = next_frontier
			current_distances = new_distances
			next_frontier = []
			new_distances = {}

			trip_stops = trip_stops + 1

			frontier.each do | vertex |

				ready_to_assess = false

				if @graph.edges.has_key? vertex

					@graph.edges[vertex].each do | next_vertex, distance |

						new_distance = current_distances[vertex] + distance

						if ! new_distances.has_key? next_vertex
							new_distances[next_vertex] = new_distance
						end

						if (new_distances.has_key? next_vertex) &&
								(new_distance < new_distances[next_vertex])
							new_distances[next_vertex] = new_distance
						end

						if next_vertex == head
							ready_to_assess = true
							trip_distances.push new_distances[next_vertex]
						end

						next_frontier.push next_vertex

					end

				end

				if (ready_to_assess)

					if limit && limit_type

						case limit_type

						when MaxStops

							if trip_stops > limit
								return trips
							else
								trips = trips + 1
							end

						when ExactStops

							if trip_stops == limit
								trips = trips + 1
							end

							if trip_stops > limit
								return trips
							end

						when MaxDistance
							minimum_new_distance = new_distances.values.min
							if minimum_new_distance && (minimum_new_distance > limit)
								trip_distances = trip_distances.select do | distance |
									distance <= limit
								end
								return trip_distances.count
							end

						end

					else
						trips = trips + 1
						return trips
					end

					ready_to_assess = false

				end

			end

		end

		return trips

	end

end
