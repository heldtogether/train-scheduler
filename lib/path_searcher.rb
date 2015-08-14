require_relative 'constants'

class PathSearcher

	def initialize (graph)

		@graph = graph

	end

	def shortest_paths(tail, head = nil)

		distances = {}
		unvisited = []

		if @graph.vertices.count > 0

			@graph.vertices.each do | vertex |
				distances[vertex] = Constants::MAX_DISTANCE
				unvisited.push(vertex)
			end

			current_distance = 0
			current_vertex = tail
			next_vertex = nil

			while ! unvisited.empty?

				if @graph.edges.has_key? current_vertex

					current_shortest = Constants::MAX_DISTANCE

					@graph.edges[current_vertex].each do | vertex, distance |

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

				new_distance = @graph.edges[current_vertex][next_vertex]

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
			return Constants::MAX_DISTANCE
		end

	end

end
