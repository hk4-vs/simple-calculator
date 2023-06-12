import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _expression = '0';
  double iconSize = 30;
  String output = '0';
  bool isEqualtoClicked = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 0.0,
        title: Text(
          "Calculator",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          Row(
            children: [
              (themeProvider.isDarkTheme == true)
                  ? Text(
                      "Dark: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  : Text(
                      "Light: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
              CupertinoSwitch(
                  value: themeProvider.isDarkTheme,
                  onChanged: (changedValue) {
                    themeProvider.themeProvider();
                  }),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.onBackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _expression,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                (_expression == '0')
                    ? Container()
                    : Text(
                        "=$output",
                        style: (isEqualtoClicked)
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.titleMedium,
                      ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 200 - 60,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          _clearExpression();
                        },
                        child: Text(
                          "AC",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    IconButton(
                      onPressed: () {
                        _backSpace();
                      },
                      icon: Icon(
                        CupertinoIcons.delete_left,
                        size: iconSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _updateExpression('%');
                      },
                      icon: Icon(
                        CupertinoIcons.percent,
                        size: iconSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _updateExpression('/');
                      },
                      icon: Icon(
                        CupertinoIcons.divide_circle_fill,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          _updateExpression('7');
                        },
                        child: Text(
                          "7",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    TextButton(
                        onPressed: () {
                          _updateExpression('8');
                        },
                        child: Text(
                          "8",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    TextButton(
                        onPressed: () {
                          _updateExpression('9');
                        },
                        child: Text(
                          "9",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    IconButton(
                      onPressed: () {
                        _updateExpression('*');
                      },
                      icon: Icon(
                        CupertinoIcons.multiply_circle_fill,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          _updateExpression('4');
                        },
                        child: Text(
                          "4",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    TextButton(
                        onPressed: () {
                          _updateExpression('5');
                        },
                        child: Text(
                          "5",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    TextButton(
                        onPressed: () {
                          _updateExpression('6');
                        },
                        child: Text(
                          "6",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    IconButton(
                      onPressed: () {
                        _updateExpression('-');
                      },
                      icon: Icon(
                        CupertinoIcons.minus_circle_fill,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          _updateExpression('1');
                        },
                        child: Text(
                          "1",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    TextButton(
                        onPressed: () {
                          _updateExpression('2');
                        },
                        child: Text(
                          "2",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    TextButton(
                        onPressed: () {
                          _updateExpression('3');
                        },
                        child: Text(
                          "3",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    IconButton(
                      onPressed: () {
                        _updateExpression('+');
                      },
                      icon: Icon(
                        CupertinoIcons.plus_circle_fill,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.fullscreen,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          _updateExpression('0');
                        },
                        child: Text(
                          "0",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    TextButton(
                        onPressed: () {
                          _updateExpression('.');
                        },
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.primary),
                        )),
                    GestureDetector(
                      onTap: () {
                        _calculateResult();
                        setState(() {
                          isEqualtoClicked = true;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).highlightColor,
                        ),
                        child: Icon(
                          CupertinoIcons.equal,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _calculateResult() {
    Parser parser = Parser();

    // Check __expression has last letter is not symbole
    String isLastLetter = _expression[_expression.length - 1];
    if (isLastLetter != "-" &&
        isLastLetter != '+' &&
        isLastLetter != '/' &&
        isLastLetter != '*' &&
        isLastLetter != '.' &&
        isLastLetter != '%') {
      Expression expression = parser.parse(_expression);
      ContextModel contextModel = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, contextModel);

      setState(() {
        output = result.toString();
      });
    }
  }

  dynamic eval(String expression) {
    return num.parse(expression);
  }

  void _updateExpression(String value) {
    setState(() {
      if (_expression == '0') {
        _expression = value;
        isEqualtoClicked = false;
      } else {
        _expression += value;
        isEqualtoClicked = false;
      }
      _calculateResult();
    });
  }

  void _clearExpression() {
    setState(() {
      _expression = '0';
    });
  }

  void _backSpace() {
    setState(() {
      if (_expression.length == 1) {
        _expression = '0';
        output = '0';
        isEqualtoClicked = false;
        _calculateResult();
      }
      if (_expression != '0') {
        _expression = _expression.substring(0, _expression.length - 1);
        isEqualtoClicked = false;
        _calculateResult();
      }
    });
  }
}
