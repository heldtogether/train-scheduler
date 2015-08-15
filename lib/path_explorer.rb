require_relative 'graph'

class PathExplorer

	def initialize (graph)

		@graph = graph

	end

	def explore (tail)

		vertices_to_explore = [tail]
		discovered_vertices = []

		while vertex = vertices_to_explore.pop

			if ! discovered_vertices.include? vertex

				discovered_vertices.push vertex

				if @graph.edges.has_key? vertex

					@graph.edges[vertex].each do | vertex, distance |

						vertices_to_explore.push vertex

					end

				end

			end

		end

		return discovered_vertices

	end

end
