type Tree = Record<string, string[]>;
type Graph = Record<string, Set<string>>;

export function degreesOfSeparation(
  familyTree: Tree,
  personA: string,
  personB: string,
): number {
  const adj = buildAdjacencyList(familyTree);
  return getBFSDistance(adj, personA, personB);
}

function buildAdjacencyList(familyTree: Tree): Graph {
  const graph: Graph = {};

  for (const child in familyTree) {
    if (!graph[child]) graph[child] = new Set<string>();
    const parents = familyTree[child];

    for (const parent of parents) {
      if (!graph[parent]) graph[parent] = new Set<string>();
      graph[child].add(parent);
      graph[parent].add(child);
    }

    // connect the two parents
    if (parents.length == 2) {
      const [p1, p2] = parents;
      graph[p1].add(p2);
      graph[p2].add(p1);
    }
  }

  return graph;
}

function getBFSDistance(adj: Graph, start: string, target: string) {
  if (start == target) return 0;
  if (!adj[start] || !adj[target]) return -1;

  let queue = [{ node: start, distance: 0 }];
  const visited = new Set([start]);

  while (queue.length > 0) {
    const { node, distance } = queue.shift()!;

    if (node == target) return distance;

    for (const neighbor of adj[node] || []) {
      if (visited.has(neighbor)) continue;
      visited.add(neighbor);
      queue.push({ node: neighbor, distance: distance + 1 });
    }
  }

  return -1;
}
