import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_animated_positioned.dart';

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

  double dvdWidth = 100;
  double dvdHeight = 100;

  update() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (_currentDragOffset.dx + dvdWidth >= screenWidth) {
      print("OUT OF BOUNDS: RIGHT");
      _currentDragOffset += Offset(-30, 0);
    } else if (_currentDragOffset.dx <= 0) {
      print("OUT OF BOUNDS: LEFT");
      _currentDragOffset += Offset(30, 0);
    }

    if (_currentDragOffset.dy + dvdHeight >= screenHeight) {
      print("OUT OF BOUNDS: BOTTOM");
      _currentDragOffset += Offset(0, -30);
    } else if (_currentDragOffset.dy <= 0) {
      print("OUT OF BOUNDS: TOP");
      _currentDragOffset += Offset(0, 30);
    }

    setState(() {});
  }

  List<Color> colors = [
    Colors.grey,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.red,
    Colors.white
  ];

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
            children: List.generate(
              9,
              (index) {
                // print("$index => ${(1400 - (index * 100))}");
                return CustomAnimatedPositioned(
                  onPanStart: (details) {
                    print("onPanStart");
                    print(details);
                    mike++;
                  },
                  onPanUpdate: (details) {
                    print("onPanUpdate");
                    print(details);
                    // var previousOffset = _currentDragOffset;
                    _currentDragOffset += details.delta;
                    mike++;

                    update();
                    setState(() {});
                  },
                  onPanEnd: (details) {
                    print("onPanEnd");
                    update();
                  },
                  currentDragOffset: _getCurrentDragOffset(),
                  duration: Duration(milliseconds: (1400 - (index * 100))),
                  size: (100 - (index * 10)).toDouble(),
                  color: colors[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
