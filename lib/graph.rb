

class Graph

	class NoRouteException < Exception
	end

	attr_accessor :edges, :vertices

	def initialize ()
		@edges = {}
	end

	def add_edge(tail, head, weight)
		end
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

end
