import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        home: const MyApp(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme())),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color bgColor = const Color.fromARGB(255, 1, 9, 16);

  final Color tColor = Colors.white;
  var input = '';
  var output = '';
  var outputSize = 34.0;
  var isChecked = false;

  void onButtonPress(String text) {
    if (text == 'AC') {
      setState(() {
        input = '';
        output = '';
      });
    } else if (text == 'C') {
      setState(() {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      });
    } else if (text == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression exp = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          output = finalValue.toString();
          input = output;
        });
      }
    } else {
      setState(() {
        input = input + text;
        if (input.length > 18) {
          input = text;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 14, 19, 24),
          body: Column(
            children: [
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        input,
                        style:
                            const TextStyle(fontSize: 60, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        output,
                        style: TextStyle(
                            color: Colors.white54, fontSize: outputSize),
                      )
                    ],
                  )),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                          text: 'AC',
                          bgC: const Color.fromARGB(255, 199, 27, 27),
                          tC: const Color.fromARGB(255, 255, 255, 255),
                          onButtonPress: onButtonPress,
                        ),
                        Buttons(
                          text: '(',
                          bgC: bgColor,
                          tC: Colors.cyan,
                          onButtonPress: onButtonPress,
                        ),
                        Buttons(
                            text: ')',
                            bgC: bgColor,
                            tC: Colors.cyan,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '/',
                            bgC: bgColor,
                            tC: const Color.fromARGB(226, 255, 92, 80),
                            onButtonPress: onButtonPress),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                            text: '7',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '8',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '9',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: 'x',
                            bgC: bgColor,
                            tC: const Color.fromARGB(226, 255, 92, 80),
                            onButtonPress: onButtonPress),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                            text: '4',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '5',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '6',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '-',
                            bgC: bgColor,
                            tC: const Color.fromARGB(226, 255, 92, 80),
                            onButtonPress: onButtonPress),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                            text: '1',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '2',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '3',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '+',
                            bgC: bgColor,
                            tC: const Color.fromARGB(226, 255, 92, 80),
                            onButtonPress: onButtonPress),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Buttons(
                            text: 'C',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '0',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '.',
                            bgC: bgColor,
                            tC: tColor,
                            onButtonPress: onButtonPress),
                        Buttons(
                            text: '=',
                            bgC: const Color.fromARGB(255, 3, 31, 54),
                            tC: tColor,
                            onButtonPress: onButtonPress),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
