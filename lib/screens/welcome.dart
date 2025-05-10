import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 116, 124, 243),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 170),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Text(
                  "Привет!\n Это твое «Колесо Баланса» — твой личный компас гармоничной жизни.\n Здесь ты сможешь:\n  ✔ Оценить, насколько гармонична твоя жизнь*\n  ✔ Получать простые шаги для улучшения* \n ✔ Следить за прогрессом и радоваться изменениям \n Готов начать? Нажми «Поехали!»",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                    color: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 121, 78, 241),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Понаехали",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
