

class Graph

	class NoRouteException < Exception
	end

	N_BYTES = [42].pack('i').size
	N_BITS = N_BYTES * 8
	MAX = 2 ** (N_BITS - 2) - 1

	MaxStops = 1
	ExactStops = 2
	MaxDistance = 4

	attr_accessor :edges, :vertices

	def initialize ()

		@vertices = []
		@edges = {}

	end

	def add_vertex(vertex)

		if ! @vertices.include? vertex
			@vertices.push vertex
		end

	end

	def add_edge(tail, head, weight)

		add_vertex(tail)
		add_vertex(head)

		if ! @edges.has_key? tail
			@edges[tail] = {}
		end

		@edges[tail][head] = weight

	end

	def edge_distance(tail, head)

		if (@edges.has_key? tail) && (@edges[tail].has_key? head)
			return @edges[tail][head]
		else
			raise NoRouteException.new
		end

	end

	def shortest_paths(tail, head = nil)

		distances = {}
		unvisited = []

		if @vertices.count > 0

			@vertices.each do | vertex |
				distances[vertex] = MAX
				unvisited.push(vertex)
			end

			current_distance = 0
			current_vertex = tail
			next_vertex = nil

			while ! unvisited.empty?

				if @edges.has_key? current_vertex

					current_shortest = MAX

					@edges[current_vertex].each do | vertex, distance |

						tentative_distance = current_distance + distance

						if tentative_distance < distances[vertex]
							distances[vertex] = tentative_distance
						end

						if (tentative_distance < current_shortest) &&
												(unvisited.include? vertex)

							current_shortest = tentative_distance
							next_vertex = vertex

							if head && next_vertex == head
								return distances
							end

						end

					end

				else

					break

				end

				if (current_distance == 0) && (current_vertex != tail)
					unvisited.delete(current_vertex)
				end

				new_distance = @edges[current_vertex][next_vertex]

				current_distance = current_distance + new_distance
				current_vertex = next_vertex

			end

		end

		return distances

	end

	def shortest_path(tail, head)

		paths = shortest_paths(tail, head)

		if paths.has_key? head
			return paths[head]
		else
			return MAX
		end

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

				if @edges.has_key? vertex

					@edges[vertex].each do | next_vertex, distance |

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
