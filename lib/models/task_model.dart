class TaskModel {
  int date;

  String title;

  String description;

  String category;

  String id;

  TaskModel({
    required this.description,
    required this.category,
    required this.date,
     this.id="",
    required this.title,
  });
}
