import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_square.dart';

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
        primarySwatch: Colors.blue,
      ),
      // color: Colors.white,
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  double posLeft = 0;
  double posRight = 0;
  double posTop = 0;
  double posBottom = 0;

  Offset _currentDragOffset = Offset(150, 350);
  int mike = 0;

  Offset? _getCurrentDragOffset() {
    return mike == 0 ? null : _currentDragOffset;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, //<-- SEE HERE

      child: Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              /// =============>
              GestureDetector(
                onPanStart: (details) {
                  print("onPanStart");
                  print(details);
                  mike++;
                },
                onPanUpdate: (details) {
                  print("onPanUpdate");
                  print(details);
                  var previousOffset = _currentDragOffset;
                  _currentDragOffset += details.delta;
                  mike++;
                  setState(() {});
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      // curve: Interval(0.06, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 1400),
                      child: CustomSquare(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                      ),
                    ),
                    AnimatedPositioned(
                      // curve: Interval(0.0325, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 1200),
                      child: CustomSquare(
                        width: 90,
                        height: 90,
                        color: Colors.green,
                      ),
                    ),
                    AnimatedPositioned(
                      // curve: Interval(0.031, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 1100),
                      child: CustomSquare(
                        width: 80,
                        height: 80,
                        color: Colors.blue,
                      ),
                    ),
                    AnimatedPositioned(
                      // curve: Interval(0.028, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 1000),
                      child: CustomSquare(
                        width: 70,
                        height: 70,
                        color: Colors.purple,
                      ),
                    ),
                    AnimatedPositioned(
                      // curve: Interval(0.0245, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 900),
                      child: CustomSquare(
                        width: 60,
                        height: 60,
                        color: Colors.yellow,
                      ),
                    ),
                    AnimatedPositioned(
                      // curve: Interval(0.02, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 800),
                      child: CustomSquare(
                        width: 50,
                        height: 50,
                        color: Colors.orange,
                      ),
                    ),
                    AnimatedPositioned(
                      // curve: Interval(0.01, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 700),
                      child: CustomSquare(
                        width: 40,
                        height: 40,
                        color: Colors.red,
                      ),
                    ),
                    AnimatedPositioned(
                      // curve: Interval(0.01, 1.0),
                      left: _getCurrentDragOffset()?.dx,
                      top: _getCurrentDragOffset()?.dy,
                      duration: Duration(milliseconds: 600),
                      child: CustomSquare(
                        width: 30,
                        height: 30,
                        color: Colors.red,
                      ),
                    ),
                    AnimatedPositioned(
                      left: _getCurrentDragOffset()?.dx,
                      // right: posRight,
                      top: _getCurrentDragOffset()?.dy,
                      // bottom: posBottom,
                      duration: Duration(milliseconds: 500),
                      child: CustomSquare(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              /// =============>
            ],
          ),
        ),
      ),
    );
  }
}
