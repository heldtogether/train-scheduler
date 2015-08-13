# Trains
---

To execute, run the following command from the project directory:

	ruby main.rb < sample_input.txt

The input file will accept edges in the form of `AB5` where `A` and `B` are the vertex names and `5` is the weighting. This edge is directed from `A` to `B`. Vertex Names can only be 1 character long. The weight can be as large as required, providing it consists only of numeric characters (no commas, etc.).

To run the tests, you will need to install dependencies with

	gem install bundle
	bundle install

then run the tests with

	rspec


## Graph Class

There is a Graph class which contains virtually all the code to solve the problems set in this task.

#### Properties

<table>
	<tr>
		<th>Property</th>
		<th>Type</th>
		<th>Use</th>
	</tr>
	<tr>
		<tr>edges</tr>
		<tr>hash</tr>
		<tr>Stores an adjacency list of the edges in the graph.</tr>
	</tr>
	<tr>
		<tr>vertices</tr>
		<tr>array</tr>
		<tr>Stores a list of the vertices in the graph.</tr>
	</tr>
</table>

### Methods

#### Add Vertex

	add_vertex(vertex)

Adds an unconnected vertex, labelled `vertex` to the graph.

#### Add Edge

	add_edge(tail, head, weight)

Adds a weighted edge to the graph. If the `tail` or `head` vertices don't exists, they will be added to the graph.

#### Edge Distance

	edge_distance(tail, head)

Returns the length of an edge between the `tail` and `head` vertices. If no edge is present, it will return 'NO SUCH ROUTE'.

#### Shortest Paths

	shortest_paths(tail, head = nil)

Performs a slightly modified version of Dijkstra's algorithm to find the shortest paths between the `tail` vertex and all other vertices in the graph. If `head` is supplied, the method will return as soon as it reaches the shortest path to that vertex.

#### Shortest Path

	shortest_path(tail, head)

As above, but returns a single number which represents the distance between the `tail` and `head` vertices.

#### Number of Trips

	num_trips(tail, head, limit = nil, limit_type = MaxStops)

Performs a breadth-first search of the graph to find the number of possible trips between the `tail` and `head` vertices. A `limit` can be supplied to allow the search to be stopped before the end of the search has been reached.

Possible values for `limit_type` are

- Graph::MaxStops

  Find trips which have a maximum number of stops. For example, "the number of trips starting at C and ending at C with a maximum of 3 stops."

- Graph::ExactStops

  Find trips which have an exact number of stops. For example, "the number of trips starting at A and ending at C with exactly 4 stops."

- Graph::MaxDistance

  Find trips which have a maximum distance travelled. For example, "the number of different routes from C to C with a distance of less than 30."
