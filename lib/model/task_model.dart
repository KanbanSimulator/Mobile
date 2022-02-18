class TaskModel {

  String title;
  List<String> progress; // list of progresses
  int value;

  TaskModel({
    required this.title,
    required this.progress,
    required this.value,
  });
}