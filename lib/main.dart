import 'package:calculator/components/my_button.dart';
import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyApp1());
  }
}

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});
  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.only(right: 10),
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 30, color: white),
                        ),
                        Text(
                          answer.toString(),
                          style: TextStyle(fontSize: 30, color: white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyBtn(
                          title: 'AC',
                          color: grey,
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '^',
                          color: grey,
                          onPress: () {
                            userInput += '^';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '%',
                          color: grey,
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '/',
                          color: orange,
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '7',
                          color: grey,
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '8',
                          color: grey,
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '9',
                          color: grey,
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: 'x',
                          color: orange,
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '4',
                          color: grey,
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '5',
                          color: grey,
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '6',
                          color: grey,
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '-',
                          color: orange,
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '1',
                          color: grey,
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '2',
                          color: grey,
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '3',
                          color: grey,
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '+',
                          color: orange,
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '0',
                          color: grey,
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '.',
                          color: grey,
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: 'DEL',
                          color: grey,
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '=',
                          color: orange,
                          onPress: () {
                            equalPress();
                            // userInput = '';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// functionp for press equal and showing result
  void equalPress() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}


//making widgets components for reusabiliy
// class MyBtn extends StatelessWidget {
//   final String title;
//   final Color color;
//   const MyBtn({super.key, required this.title, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: Colors.pinkAccent,
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(color: color),
//           ),
//         ),
//       ),
//     );
//   }
// }
