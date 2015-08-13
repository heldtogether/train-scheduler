

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

	def shortest_path(tail, head = nil)

		distances = {}
		visited = {}

		if (@vertices.count > 0)

			@vertices.each do | vertex |
				distances[vertex] = MAX
				visited[vertex] = nil
			end

			distances[tail] = 0

			shortest_distance = MAX
			closest_vertex = nil

			if (@edges.has_key? tail)
				@edges[tail].each do | vertex, distance |
					if (distance < shortest_distance)
						closest_vertex = vertex
						shortest_distance = distance
					end
				end
			end

			if (closest_vertex)
				distances[closest_vertex] = shortest_distance
			end

		end

		return distances

	end

end
