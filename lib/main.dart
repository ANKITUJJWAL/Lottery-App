import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();

  int x = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Lottery App')),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text('Lottery winning number is 4')),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 100,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 5,
                                color: Colors.black,
                                blurRadius: 0)
                          ],
                          color: x == 4
                              ? Color.fromARGB(221, 14, 14, 14)
                              : Color.fromARGB(255, 20, 19, 19).withOpacity(.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: x == 4
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.done_all,
                                    color: Color.fromARGB(255, 6, 230, 84),
                                    size: 35,
                                  ),
                                  Text(
                                    'Congratulation you have won the lottery, your number is $x \n',
                                    textAlign: TextAlign.center,
                                    selectionColor:
                                        Color.fromARGB(241, 243, 247, 5),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 235, 243, 6),
                                        fontSize: 25.0),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                    Text(
                                      'Btter luck next time your number is ${x} try again',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 240, 14, 2),
                                          fontSize: 25.0),
                                    ),
                                  ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              x = random.nextInt(5);
              print(x);
            });
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
