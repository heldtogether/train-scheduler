

class Graph

	attr_accessor :vertices

	def initialize ()
		@vertices = {}
	end

	def add_edge(tail, head, weight)
		if ! @vertices.has_key? tail
			@vertices[tail] = {}
		end
		@vertices[tail][head] = weight
	end

	def edge_distance(tail, head)
		if (@vertices.has_key? tail) && (@vertices[tail].has_key? head)
			return @vertices[tail][head]
		else
			return 0
		end
	end

	def path_distance(path)
		if path.count >= 2
			previous_node = nil
			distance = 0
			path.each do | node |
				if previous_node
					distance += edge_distance(previous_node, node)
				end
				previous_node = node
			end
			return distance
		else
			return 0
		end
	end

end
