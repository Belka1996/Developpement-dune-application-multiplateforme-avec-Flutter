class Task {
  String id;
  String title;
  String? date;
  String? priority;
  String? course;
  String? notes;
  bool isfavorite;

  Task({
    required this.id,
    required this.title,
    this.date,
    this.priority,
    this.course,
    this.notes,
    this.isfavorite = false,
  });
}