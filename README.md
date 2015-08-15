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



## Graph

The `Graph` class which contains details of the vertices and edges which make up the graph.

### Properties

- Property: `edges`
- Type: `hash`
- Description: Stores an adjacency list of the edges in the graph.

- Property: `vertices`
- Type: `array`
- Description: Stores a list of the vertices in the graph.

### Methods

### Initialize

    Graph.new

#### Add Vertex

	add_vertex(vertex)

Adds an unconnected vertex, labelled `vertex` to the graph.

#### Add Edge

	add_edge(tail, head, weight)

Adds a weighted edge to the graph. If the `tail` or `head` vertices don't exists, they will be added to the graph.

#### Edge Distance

	edge_distance(tail, head)

Returns the length of an edge between the `tail` and `head` vertices. If no edge is present, it will raise `NoRouteException`.



## Path Measurer

The `PathMeasurer` class contains methods to measure the length of paths within the supplied `Graph`

### Properties

- Property: `graph`
- Type: `Graph`
- Description: The graph against which to perform the measurements.

### Methods

### Initialize

    PathMeasurer.new(graph)

#### Distance

	distance(path)

Returns the cumulative length of the edges between the vertices in the `path` array. If no path is present, it will return 'NO SUCH ROUTE'.

The path array should just contain the vertices in the order in which they should be traversed. For example `path = ['A', 'D', 'C']`.



## Path Searcher

The `PathSearcher` class contains methods to find routes through the supplied `Graph`.

### Properties

- Property: `graph`
- Type: `Graph`
- Description: The graph to search.

### Methods

### Initialize

    PathSearcher.new(graph)

#### Shortest Paths

	shortest_paths(tail, head = nil)

Performs a slightly modified version of Dijkstra's algorithm to find the shortest paths between the `tail` vertex and all other vertices in the graph. If `head` is supplied, the method will return as soon as it reaches the shortest path to that vertex.

The modification allows us to assess paths which return to the `tail` vertex. It assumes that "for a given route, the starting and ending town will not be the same town".

#### Shortest Path

	shortest_path(tail, head)

As above, but returns a single number which represents the shortest path between the `tail` and `head` vertices.



## Path Explorer

The `PathExplorer` class contains methods to traverse through the supplied `Graph`. It delegates the logic of deciding whether a found path is valid etc. to a supplied subclass of the `DefaultChecker` class.

There are a number of checker classes available:

- `DefaultChecker`

  Considers all paths to be valid and will not cause the search to stop, even in the case of looping graphs.

- `ExactPathLengthChecker`

  Determines a path is valid and worth recording if it contains an exact number of vertices (not including the starting vertex).

- `MaxPathLengthChecker`

  Determines a path is valid and worth recording if it has less than or equal to a given number of vertices (not including the starting vertex).

- `MaxPathDistanceChecker`

  Determines a path is valid and worth recording if the distance to traverse the path is strictly less than a given distance.

- `UniqueVertexChecker`

  Will only allow a node to be visited once and once only.

### Properties

- Property: `graph`
- Type: `Graph`
- Description: The graph to traverse.

- Property: `checker`
- Type: `DefaultChecker` (must implement )
- Description: The graph against which to perform the measurements.

### Methods

### Initialize

    PathExplorer.new(graph, checker)

#### Explore

	explore (tail, head = nil)

Traverses the graph in a depth-first fashion from the `tail` vertex, returning the available paths. If a `head` vertex is supplied then only paths which reach this vertex are considered.



## Path Explorer Checkers

### Properties

- Property: `graph`
- Type: `Graph`
- Description: The graph to traverse.


### Methods

### Initialize

    PathExplorer.new(graph, comparison)

#### Should Visit?

	should_visit? (vertex, current_path)

Should be called to determine if a vertex should be visited.

#### Did Visit

	did_visit (vertex)

Should be called once a vertex has been visited.

#### Valid Path?

	valid_path? (path)

Should be called to determine if a path being considered is valid according to the rules of the checker, e.g. does it contain the correct number of vertices?

#### Finish Exploring?

	finished_exploring? (vertices_to_explore)

Should be called to determine if there are any paths that remain to be explored could possible meet the rules of the checker. If there are none remaining then we can stop exploring the graph.
