class TreeNodeData {

  final String value;

  double x;
  double y;

  TreeNodeData? left;
  TreeNodeData? right;

  TreeNodeData({
    required this.value,
    required this.x,
    required this.y,
    this.left,
    this.right,
  });
}