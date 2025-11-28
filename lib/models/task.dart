class task {
  String id;
  String title;
  String? date;
  String? priority;
  String? course;
  String? notes;
  bool isfavorite;

  task({
    required this.id,
    required this.title,
    this.date,
    this.priority,
    this.course,
    this.notes,
    this.isfavorite = false,
  });
}