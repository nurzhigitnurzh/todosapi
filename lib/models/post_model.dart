class PostModel {
  PostModel({
    this.id =0,
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
  Map<String,dynamic> toJson(){
    return{
      
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
}

}