import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:timezone/data/latest.dart' as tz;
//import 'package:wheel2/helpers/notifications.dart';
import 'package:wheel2/screens/quiz_results.dart';
import 'package:wheel2/screens/quiz.dart';
import 'package:wheel2/screens/rec.dart';
import 'package:wheel2/screens/welcome.dart';
import 'package:wheel2/task_manager/data_service.dart';
import 'package:wheel2/task_manager/topics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataService.resetData(); // Сбрасываем старые данные
  await DataService.init(); // Инициализируем с новыми данными
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomePage(),
      routes: {
        '/home': (context) => const WelcomePage(),
        '/quiz': (context) => const QuizPage(),
        '/result': (context) => const ResultPage(),
        '/recommendation': (context) => const RecommendationPage(),
        '/rec_points': (context) => const TopicsScreen(),
      },
    );
  }
}
