import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key:key);

  // this widget is the root of the application
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}): super(key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentvalue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.tealAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _currentvalue.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Slider(value: _currentvalue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _currentvalue.toString(),
                    onChanged: (value){
                  setState(() {
                    _currentvalue=value;
                  });
                }
                )
              ],
            ),
    ),
          ),
      );
      }
  }