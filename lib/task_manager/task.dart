enum TaskStatus { current, completed, deleted }

class Task {
  final String id;
  final String topicId;
  final String title;
  final String description;
  TaskStatus status;

  Task({
    required this.id,
    required this.topicId,
    required this.title,
    required this.description,
    this.status = TaskStatus.current,
  });

  static TaskStatus statusFromString(String status) {
    return TaskStatus.values.firstWhere(
      (e) => e.toString().split('.').last == status,
      orElse: () => TaskStatus.current,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'topicId': topicId,
    'title': title,
    'description': description,
    'status': status.toString().split('.').last,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    topicId: json['topicId'],
    title: json['title'],
    description: json['description'],
    status: statusFromString(json['status']),
  );
}
