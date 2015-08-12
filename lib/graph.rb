

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

end
