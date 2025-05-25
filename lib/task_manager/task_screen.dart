// task_screen.dart
import 'package:flutter/material.dart';
import 'package:wheel2/task_manager/topic.dart';
import 'data_service.dart';
import 'task.dart';

class TasksScreen extends StatefulWidget {
  final String topicId;

  const TasksScreen({super.key, required this.topicId});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Topic currentTopic;
  late List<Task> currentTasks;
  late List<Task> completedTasks;
  late List<Task> deletedTasks;

  @override
  void initState() {
    super.initState();
    currentTopic = DataService.topics.firstWhere((t) => t.id == widget.topicId);
    _updateTasks();
  }

  void _updateTasks() {
    currentTasks =
        DataService.tasks
            .where(
              (t) =>
                  t.topicId == widget.topicId && t.status == TaskStatus.current,
            )
            .toList();
    completedTasks =
        DataService.tasks
            .where(
              (t) =>
                  t.topicId == widget.topicId &&
                  t.status == TaskStatus.completed,
            )
            .toList();
    deletedTasks =
        DataService.tasks
            .where(
              (t) =>
                  t.topicId == widget.topicId && t.status == TaskStatus.deleted,
            )
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentTopic.name),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Текущие'),
              Tab(icon: Icon(Icons.check), text: 'Выполненные'),
              Tab(icon: Icon(Icons.delete), text: 'Удаленные'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTaskList(currentTasks),
            _buildTaskList(completedTasks),
            _buildTaskList(deletedTasks),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _showAddTaskDialog(),
        ),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => _buildTaskItem(tasks[index]),
    );
  }

  Widget _buildTaskItem(Task task) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(task.title),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.description, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                _buildTaskActions(task),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskActions(Task task) {
    switch (task.status) {
      case TaskStatus.current:
        return Row(
          children: [
            ElevatedButton(
              child: Text('Выполнить'),
              onPressed: () => _handleTaskCompletion(task),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => _deleteTask(task),
              child: Text('Удалить'),
            ),
          ],
        );
      default:
        return ElevatedButton(
          child: Text('Вернуть в работу'),
          onPressed: () => _returnTask(task),
        );
    }
  }

  void _handleTaskCompletion(Task task) {
    setState(() {
      DataService.updateTaskStatus(task.id, TaskStatus.completed);
      DataService.increaseTopicRating(task.topicId);
      _updateTasks();
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      DataService.updateTaskStatus(task.id, TaskStatus.deleted);
      _updateTasks();
    });
  }

  void _returnTask(Task task) {
    setState(() {
      DataService.updateTaskStatus(task.id, TaskStatus.current);
      _updateTasks();
    });
  }

  void _showAddTaskDialog() {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Новая задача'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Название'),
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(labelText: 'Описание'),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Отмена'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: Text('Добавить'),
                onPressed: () {
                  final newTask = Task(
                    id:
                        '${widget.topicId}_task${DateTime.now().millisecondsSinceEpoch}',
                    topicId: widget.topicId,
                    title: titleController.text,
                    description: descController.text,
                  );
                  DataService.tasks.add(newTask);
                  DataService.saveData();
                  setState(() => _updateTasks());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }
}
