import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('YourBMI'),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Enter your weight'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height(in feet)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: inController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Enter your height in inch'),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          //BMI calculation
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (ift * 12) + iInch;

                          var tCm = tInch * 2.54;

                          var tM = tCm / 100;

                          var bmi = iwt / (tM * tM);

                          var msg = "";
                          if (bmi > 25) {
                            msg = "You are overweight!!!";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You are underweight!!";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You are healthy.";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blank";
                          });
                        }
                      },
                      child: const Text('Calculate')),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
