import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi_cala extends StatefulWidget {
  const Bmi_cala({Key? key}) : super(key: key);

  @override
  _Bmi_calaState createState() => _Bmi_calaState();
}

class _Bmi_calaState extends State<Bmi_cala> {
  bool isMale = true;
  double height = 180;
  int weight = 100;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Bmi Calculator",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  firstEx(
                      person: true,
                      iconData: Icons.male,
                      text: 'Male',
                      person2: true),
                  const SizedBox(
                    width: 14,
                  ),
                  firstEx(
                      person: false,
                      iconData: Icons.female,
                      text: 'FeMale',
                      person2: false),
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w900),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 300,
                        min: 100,
                        activeColor: Colors.pinkAccent,
                        inactiveColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[500]),
                    child: Column(
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "$weight",
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "weight++",
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              mini: true,
                              backgroundColor: Colors.grey[500],
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: "weight--",
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              mini: true,
                              backgroundColor: Colors.grey[500],
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[500]),
                    child: Column(
                      children: [
                        const Text(
                          "AGE",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "$age",
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "age++",
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              mini: true,
                              backgroundColor: Colors.grey[500],
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: "age--",
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              mini: true,
                              backgroundColor: Colors.grey[500],
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            )),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  print(result.round());
                },
                color: Colors.pink,
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget firstEx(
      {String? text, bool? person, IconData? iconData, required bool person2}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = person!;
          });
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData!,
                size: 90,
                color: Colors.white,
              ),
              Text(
                text!,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: person2 ? Colors.blue : Colors.grey[500],
          ),
        ),
      ),
    );
  }


}
