import 'todo_model.dart';

class DataModel {
  int? limit;
  int? skip;
  int? total;
  List<TodoModel>? todos;

  DataModel(
      {required this.total,
      required this.limit,
      required this.skip,
      required this.todos});


  factory DataModel.fromJson(Map<String,dynamic> json){

    List<TodoModel> mTodos = [];

    for(Map<String,dynamic> eachTodo in json['todos']){
      mTodos.add(TodoModel.fromJson(eachTodo));
    }

    return DataModel(total: json['total'], limit: json['limit'], skip: json['skip'], todos: mTodos);

  }
}
