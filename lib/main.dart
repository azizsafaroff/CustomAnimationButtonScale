import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController? _animationController;

  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ScaleTransition Animation",
        ),
      ),
      body: Center(
        child: ScaleTransition(
          
          // shrink from 1.0 => Fulsize to 0.9 => 90% size 
          scale: Tween(begin: 1.0, end: 0.9).animate(
            
            // Curve animation for soft animation
            CurvedAnimation(
              // set controller
              parent: _animationController!,
              // mode curve 
              curve: Curves.easeIn,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              
              // To start animation from large to small and from small 
              // to large when pressed briefly
              _animationController!.forward().then((value) {
                _animationController!.reverse();
              });

              print("Clicked!");
            },
            onLongPressStart: (v) {

              // To start animation from large to small when start long pressed
              _animationController!.forward();

              print("Click Started!");
            },
            onLongPressEnd: (v) {
              
              // And To reverse animation from small to large when end long pressed
              _animationController!.reverse();

              print("Click Ended!");
            },

            // Our button custom widget
            child: Container(
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              alignment: Alignment.center,
              child: Text(
                "Click",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
