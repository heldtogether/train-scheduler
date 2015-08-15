require_relative 'graph'

class PathExplorer

	class DefaultChecker

		def should_visit? (vertex)
			return true
		end

		def did_visit vertex
			# Do nothing
		end

	end

	def initialize (graph, checker = nil)

		@graph = graph

		if ! checker

			checker = DefaultChecker.new

		end

		@checker = checker

	end

	def explore (tail)

		vertices_to_explore = {tail => []}

		paths = []

		while vertex = vertices_to_explore.keys.pop

			current_path = vertices_to_explore[vertex].clone

			vertices_to_explore.delete vertex

			if @checker.should_visit? vertex

				@checker.did_visit vertex

				current_path.push vertex

				if @graph.edges.has_key? vertex

					@graph.edges[vertex].each do | vertex, distance |

						vertices_to_explore[vertex] = current_path

					end

				else

					paths.push current_path

				end

			end

		end

		return paths

	end

end
