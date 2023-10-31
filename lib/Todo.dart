class Todo{
  String todoName;
  DateTime currentTime, updatTime;
  String statas  = 'Pending';

  Todo({
    required this.todoName,
    required this.currentTime,
    required this.updatTime,
    required this.statas,
});
}