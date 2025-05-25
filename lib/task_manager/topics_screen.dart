import 'package:flutter/material.dart';
import 'data_service.dart';
import 'task_screen.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Категории: ')),
      body: ListView.builder(
        itemCount: DataService.topics.length,
        itemBuilder: (context, index) {
          final topic = DataService.topics[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(topic.name, style: TextStyle(fontSize: 20)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(topic.activeDescription),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: topic.rating / 10,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TasksScreen(topicId: topic.id),
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
