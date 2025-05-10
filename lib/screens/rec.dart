import 'package:flutter/material.dart';
import 'package:wheel2/helpers/entitys.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  int index = 0;

  String? validate(double point, int index) {
    if (point < -4) {
      return recommendation[index]["rec1"];
    }
    if (point >= -4 && point < 5) {
      return recommendation[index]["rec2"];
    }
    if (point >= 5) {
      return recommendation[index]["rec3"];
    } else {
      return "error";
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments! as Map;
    return Scaffold(
      appBar: AppBar(title: const Text('Наши рекомендации:')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: recommendation.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Text(
                  recommendation[index]["theme"]!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  validate(
                    data[concat(recommendation[index]["id"]!)],
                    index,
                  ).toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

String concat(String theme) {
  return '${theme}Points';
}
