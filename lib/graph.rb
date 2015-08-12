

class Graph

	attr_accessor :vertices

	def initialize ()
		@vertices = {}
	end

	def add_vertex(tail, head, weight)
		if ! @vertices.has_key? tail
			@vertices[tail] = {}
		end
		@vertices[tail][head] = weight
	end

	def distance(tail, head)
		if (@vertices.has_key? tail) && (@vertices[tail].has_key? head)
			return @vertices[tail][head]
		else
			return 0
		end
	end

end
