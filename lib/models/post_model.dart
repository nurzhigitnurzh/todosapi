class PostModel {
  PostModel({
    required this.id,
    required this.todo,
    required this.completed, 
    required this.userId,});
  final int id;
  final String todo;
  final bool completed;
  final int userId;
  factory PostModel.fromJson(Map<String,dynamic>json){
    return PostModel(
      completed: json['completed'], 
      id: json['id'], 
      todo: json['todo'],
      userId: json['userId'],
    
    );
  }
}

