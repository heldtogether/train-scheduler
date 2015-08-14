

class Graph

	class NoRouteException < Exception
	end

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

end
