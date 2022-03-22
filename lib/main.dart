import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'safe_cracker_widgets/safe_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeCrackerView(),
    );
  }
}

class SafeCrackerView extends StatefulWidget {
  const SafeCrackerView({Key? key}) : super(key: key);

  @override
  State<SafeCrackerView> createState() => _SafeCrackerViewState();
}

class _SafeCrackerViewState extends State<SafeCrackerView> {
  List<int> values = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text("Safe Cracker"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              true ? CupertinoIcons.lock_open : CupertinoIcons.lock,
              size: 95,
              color: Colors.redAccent,
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              height: 120,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int i = 0; i < values.length; i++)
                  SafeDial(
                    startingValue: values[i],
                    onIncrement: () {
                      setState(() {
                        values[i]++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        values[i]--;
                      });
                    },
                  ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 48),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(32),
                  color: Colors.greenAccent,
                  child: Text("Open the safe"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int sumOfAllValues(List<int> list) {
    var temp = 0;
    for (int i = 0; i < list.length; i++) {
      temp += list[i];
    }

    // for (int number in list) {
    //   temp += number;
    // }
    return temp;
  }
}

class NumberHolder extends StatelessWidget {
  final dynamic content;
  const NumberHolder({Key? key, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        constraints: const BoxConstraints(minHeight: 60),
        width: double.infinity,
        color: Colors.pink.shade200,
        child: Center(
          child: Text(
            "$content",
            textAlign: TextAlign.center,
          ),
        ));
  }
}

class IncrementalNumberHolder extends StatefulWidget {
  final Function(int) onUpdate;
  final int startingValue;
  const IncrementalNumberHolder(
      {Key? key, this.startingValue = 0, required this.onUpdate})
      : super(key: key);

  @override
  State<IncrementalNumberHolder> createState() =>
      _IncrementalNumberHolderState();
}

class _IncrementalNumberHolderState extends State<IncrementalNumberHolder> {
  @override
  void initState() {
    currentValue = widget.startingValue;
    super.initState();
  }

  late int currentValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(4),
        width: double.infinity,
        color: Colors.orangeAccent,
        constraints: const BoxConstraints(minHeight: 60),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentValue--;
                });
                widget.onUpdate(currentValue);
              },
              icon: Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Text(
                "$currentValue",
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentValue++;
                });

                widget.onUpdate(currentValue);
              },
              icon: Icon(Icons.chevron_right),
            ),
          ],
        ));
  }
}
