class Task {

  String id,task;
  bool completed;

  Task({required this.id, required this.task, required this.completed});

  // Task.fromJson(Map<String, dynamic> json)
  //     : this(
  //         task: json['task'],
  //         completed: json['completed'],
  //       );

  // Map<String, dynamic> toJson() {
  //   return {
  //     "task": task,
  //     "completed": completed,
  //   };
  // }
}
