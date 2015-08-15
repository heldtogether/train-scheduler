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



# Problem

---

The local commuter railroad services a number of towns in Kiwiland.  Because of monetary concerns, all of the tracks are 'one-way.'  That is, a route from Kaitaia to Invercargill does not imply the existence of a route from Invercargill to Kaitaia.  In fact, even if both of these routes do happen to exist, they are distinct and are not necessarily the same distance!

The purpose of this problem is to help the railroad provide its customers with information about the routes.  In particular, you will compute the distance along a certain route, the number of different routes between two towns, and the shortest route between two towns.

Input:  A directed graph where a node represents a town and an edge represents a route between two towns.  The weighting of the edge represents the distance between the two towns.  A given route will never appear more than once, and for a given route, the starting and ending town will not be the same town.

Output: For test input 1 through 5, if no such route exists, output 'NO SUCH ROUTE'.  Otherwise, follow the route as given; do not make any extra stops!  For example, the first problem means to start at city A, then travel directly to city B (a distance of 5), then directly to city C (a distance of 4).

- The distance of the route A-B-C.
- The distance of the route A-D.
- The distance of the route A-D-C.
- The distance of the route A-E-B-C-D.
- The distance of the route A-E-D.
- The number of trips starting at C and ending at C with a maximum of 3 stops.  In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops).
- The number of trips starting at A and ending at C with exactly 4 stops.  In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D); and A to C (via D,E,B).
- The length of the shortest route (in terms of distance to travel) from A to C.
- The length of the shortest route (in terms of distance to travel) from B to B.
- The number of different routes from C to C with a distance of less than 30.  In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC.



# API

---

## Graph

The `Graph` class which contains details of the vertices and edges which make up the graph.

### Properties

#### Edges

- Property: `edges`
- Type: `hash`
- Description: Stores an adjacency list of the edges in the graph.

#### Vertices

- Property: `vertices`
- Type: `array`
- Description: Stores a list of the vertices in the graph.

### Methods

### Initialize

    Graph.new

#### Add Vertex

	add_vertex (vertex)

Adds an unconnected vertex, labelled `vertex` to the graph.

#### Add Edge

	add_edge (tail, head, weight)

Adds a weighted edge to the graph. If the `tail` or `head` vertices don't exists, they will be added to the graph.

#### Edge Distance

	edge_distance (tail, head)

Returns the length of an edge between the `tail` and `head` vertices. If no edge is present, it will raise `NoRouteException`.



## Path Measurer

The `PathMeasurer` class contains methods to measure the length of paths within the supplied `Graph`

### Methods

### Initialize

    PathMeasurer.new(graph)

#### Distance

	distance(path)

Returns the cumulative length of the edges between the vertices in the `path` array. If no path is present, it will return 'NO SUCH ROUTE'.

The path array should just contain the vertices in the order in which they should be traversed. For example `path = ['A', 'D', 'C']`.



## Path Searcher

The `PathSearcher` class contains methods to find routes through the supplied `Graph`.

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

### Methods

### Initialize

    PathExplorer.new(graph, checker)

#### Explore

	explore (tail, head = nil)

Traverses the graph in a depth-first fashion from the `tail` vertex, returning the available paths. If a `head` vertex is supplied then only paths which reach this vertex are considered.



## Path Explorer Checkers

### Methods

### Initialize

    DefaultChecker.new(graph, comparison)

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
