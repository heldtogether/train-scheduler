require_relative 'graph'

class UniqueVertexChecker

	def initialize (graph)

		@graph = graph
		@discovered_vertices = []

	end

	def should_visit? (vertex)

		if ! @discovered_vertices.include? vertex

			return true

		else

			return false

		end

	end

	def did_visit (vertex)

		@discovered_vertices.push vertex

	end

	def valid_path? path

		return true

	end

end
