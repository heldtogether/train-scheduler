

class Graph

	class NoRouteException < Exception
	end

	N_BYTES = [42].pack('i').size
	N_BITS = N_BYTES * 8
	MAX = 2 ** (N_BITS - 2) - 1

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

	def path_distance(path)
		begin
			if path.count >= 2
				previous_vertex = nil
				distance = 0
				path.each do | vertex |
					if previous_vertex
						distance += edge_distance(previous_vertex, vertex)
					end
					previous_vertex = vertex
				end
				return distance
			else
				return 0
			end
		rescue NoRouteException
			return 'NO SUCH ROUTE'
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

			distances[tail] = 0

			current_distance = 0
			current_vertex = tail
			next_vertex = nil
			current_shortest = MAX

			while ! unvisited.empty?

				if @edges.has_key? current_vertex

					current_shortest = MAX

					@edges[current_vertex].each do | vertex, distance |

						tentative_distance = current_distance + distance

						if tentative_distance < distances[vertex]
							distances[vertex] = tentative_distance
						end

						if tentative_distance < current_shortest
							current_shortest = tentative_distance
							next_vertex = vertex
						end

					end

				else

					break

				end

				unvisited.delete(current_vertex)

				current_distance = current_distance + @edges[current_vertex][next_vertex]
				current_vertex = next_vertex

			end

		end

		return distances

	end

end
