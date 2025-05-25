import 'package:flutter/material.dart';
import 'package:wheel2/helpers/entitys.dart';
import 'package:wheel2/helpers/screenParametres.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  double workCounter = 0;
  double moneyCounter = 0;
  double familyCounter = 0;
  double sportCounter = 0;
  double healthCounter = 0;
  double friendsCounter = 0;
  double developmentCounter = 0;
  double hobbyCounter = 0;

  //int incorrectAnswers = 0;

  // ignore: unused_field

  // void fetchData() {

  @override
  void initState() {
    super.initState();
    questions.shuffle();
    // _quizBox.put('chance', 3);
    //fetchData();
    // index = Random().nextInt(questions.length);
  }

  void validate(double choise, String theme) {
    switch (theme) {
      case "work":
        workCounter += choise;
      case "money":
        moneyCounter += choise;
      case "family":
        familyCounter += choise;
      case "sport":
        sportCounter += choise;
      case "health":
        healthCounter += choise;
      case "friends":
        friendsCounter += choise;
      case "development":
        developmentCounter += choise;
      case "hobby":
        hobbyCounter += choise;
    }
    if (index < questions.length - 1) {
      index++;
    } else {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: {
          "workPoints": workCounter,
          "moneyPoints": moneyCounter,
          "familyPoints": familyCounter,
          "sportPoints": sportCounter,
          "healthPoints": healthCounter,
          "friendsPoints": friendsCounter,
          "developmentPoints": developmentCounter,
          "hobbyPoints": hobbyCounter,
          "totalAnswers": questions.length,
        },
      );
    }
    setState(() {});
  }

  Widget choicebutton(String text, double choise) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: MaterialButton(
        onPressed: () {
          validate(choise, questions[index]["theme"]!);
        },
        color: Colors.blue,
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(48, 32, 77, 1.0),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Icon(
                    Icons.keyboard_backspace_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              width: displayWidth(context) * 0.95,
              height: displayHeight(context) * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    width: displayWidth(context) * 0.8,
                    height: displayHeight(context) * 0.125,
                    child: Text(
                      questions[index]["question"]!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  choicebutton('Да', 1.42),
                  choicebutton("Скорее всего да", 1.00),
                  choicebutton("Не знаю точно", 0.70),
                  choicebutton("Скорее всего нет", 0.40),
                  choicebutton("Нет", 0.01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
