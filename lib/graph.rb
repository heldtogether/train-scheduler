

class Graph

	attr_accessor :vertices

	def initialize ()
		@vertices = {}
	end

	def add_vertex(tail, head, weight)
		@vertices[tail] = {head=>weight}
	end

end
