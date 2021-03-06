require_relative 'graph'
require_relative 'default_checker'

class PathExplorer

	def initialize (graph, checker = nil)

		@graph = graph

		if ! checker

			checker = DefaultChecker.new

		end

		@checker = checker

	end

	def explore (tail, head = nil)

		vertices_to_explore = [
			{
				:vertex => tail,
				:arrival_path => []
			}
		]

		paths = []

		while vertex = vertices_to_explore.pop

			current_path = vertex[:arrival_path].clone
			vertex = vertex[:vertex]

			is_leaf = false

			if @checker.should_visit?(vertex, current_path)

				@checker.did_visit vertex

				current_path.push vertex

				if @graph.edges.has_key? vertex

					@graph.edges[vertex].each do | vertex, distance |

						vertices_to_explore.push({
							:vertex => vertex,
							:arrival_path => current_path
						})

					end

				else

					is_leaf = true

				end

				if (current_path.length > 1) && ((!head && is_leaf) || (head && vertex == head))

					if @checker.valid_path? current_path

						paths.push current_path

					end

				end

			end

			if @checker.finished_exploring? vertices_to_explore

				break;

			end

		end

		return paths

	end

end
