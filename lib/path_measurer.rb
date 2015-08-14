

class PathMeasurer

	def initialize (graph)

		@graph = graph

	end

	def distance (path)

		begin

			if path.count >= 2

				previous_vertex = nil
				distance = 0

				path.each do | vertex |

					if previous_vertex
						distance += @graph.edge_distance(previous_vertex, vertex)
					end

					previous_vertex = vertex

				end

				return distance

			else

				return 0

			end

		rescue Graph::NoRouteException

			return 'NO SUCH ROUTE'

		end

	end

end
