class Todo {
  late int? id;
  late String title;
  late String description;

  Todo({
    this.id,
    required this.title,
    required this.description,
  });

  //외부로 보낼 모델, json형식, 플러에선 Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  //외부에서 받아올 모델
  Todo.fromMap(Map<dynamic, dynamic>? map) {
    id = map?['id'];
    title = map?['title'];
    description = map?['description'];
  }
}
