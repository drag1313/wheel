import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wheel2/quiz_results.dart';
import 'package:wheel2/screens/quiz.dart';
import 'package:wheel2/screens/rec.dart';
import 'package:wheel2/screens/welcome.dart';

void main() async {
  //await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unused_local_variable
  //var box = await Hive.openBox('appBox');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
  //runApp(const MyApp());
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
      },
    );
  }
}
