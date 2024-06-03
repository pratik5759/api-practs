class TodoModel{
  int? id;
  bool? completed;
  String? todo;
  int? userId;

  TodoModel({
    required this.id,
    required this.completed,
    required this.todo,
    required this.userId,
});

  factory TodoModel.fromJson(Map<String ,dynamic> json){
    return TodoModel(id: json['id'], completed: json['completed'], todo: json['todo'], userId: json['userId']);
  }

}