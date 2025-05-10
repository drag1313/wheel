import 'dart:core';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wheel2/helpers/screenParametres.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments! as Map;

    double workCounter = data["workPoints"];
    double moneyCounter = data["moneyPoints"];
    double familyCounter = data["familyPoints"];
    double sportCounter = data["sportPoints"];
    double healthCounter = data["healthPoints"];
    double friendsCounter = data["friendsPoints"];
    double developmentCounter = data["developmentPoints"];
    double hobbyCounter = data["hobbyPoints"];

    List<PieChartSectionData> list = [
      PieChartSectionData(
        value: workCounter,
        title: "Работа",
        radius: displayWidth(context) / 2 * pieValidate(workCounter),
        color: Colors.redAccent,
      ),
      PieChartSectionData(
        value: moneyCounter,
        title: "Финансы",
        radius: displayWidth(context) / 2 * pieValidate(moneyCounter),
        color: Colors.lightGreen,
      ),
      PieChartSectionData(
        value: familyCounter,
        title: "Отношения",
        radius: displayWidth(context) / 2 * pieValidate(familyCounter),
        color: Colors.amberAccent,
      ),
      PieChartSectionData(
        value: sportCounter,
        title: "Спорт",
        radius: displayWidth(context) / 2 * pieValidate(sportCounter),
        color: Colors.cyanAccent,
      ),
      PieChartSectionData(
        value: healthCounter,
        title: "Здоровье",
        radius: displayWidth(context) / 2 * pieValidate(healthCounter),
        color: Colors.deepOrangeAccent,
      ),
      PieChartSectionData(
        value: friendsCounter,
        title: "Друзья",
        radius: displayWidth(context) / 2 * pieValidate(friendsCounter),
        color: Colors.lightBlue,
      ),
      PieChartSectionData(
        value: developmentCounter,
        title: "Развитие",
        radius: displayWidth(context) / 2 * pieValidate(developmentCounter),
        color: Colors.purple,
      ),
      PieChartSectionData(
        value: hobbyCounter,
        title: "Хобби",
        radius: displayWidth(context) / 2 * pieValidate(hobbyCounter),
        color: Colors.pink,
      ),
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 70, left: 50),
              width: double.infinity,
              color: Colors.green,
              child: const Text(
                'Тестирование завершено',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: const Color.fromARGB(255, 128, 243, 132),
              child: PieChart(
                PieChartData(
                  sections: list,
                  sectionsSpace: 5,
                  centerSpaceRadius: 20,
                  titleSunbeamLayout: true,
                  borderData: FlBorderData(show: true),
                ),

                duration: const Duration(milliseconds: 150), // Optional
                curve: Curves.linear, // Optional
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/quiz');
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Пройти еще раз",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/recommendation',
                          arguments: {
                            "workPoints": workCounter,
                            "moneyPoints": moneyCounter,
                            "familyPoints": familyCounter,
                            "sportPoints": sportCounter,
                            "healthPoints": healthCounter,
                            "friendsPoints": friendsCounter,
                            "developmentPoints": developmentCounter,
                            "hobbyPoints": hobbyCounter,
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Получить рекомендации",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double pieValidate(double index) {
  double corrector = index.ceil().toDouble() * 0.1;
  return corrector;
}
