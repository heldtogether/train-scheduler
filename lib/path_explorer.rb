require_relative 'graph'

class PathExplorer

	def initialize (graph)

		@graph = graph

	end

	def explore (tail)

		vertices_to_explore = {tail => []}
		discovered_vertices = []

		paths = []

		while vertex = vertices_to_explore.keys.pop

			current_path = vertices_to_explore[vertex].clone

			vertices_to_explore.delete vertex

			if ! discovered_vertices.include? vertex

				discovered_vertices.push vertex
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
