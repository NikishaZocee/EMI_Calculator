import 'package:ding/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      home: const Intro(),
    );
  }
}

class Intro extends StatefulWidget{
  const Intro({Key? key}): super(key:key);

  @override
  State<Intro> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Intro> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        child: Stack(

          children: [

            Positioned(
                right:0,
                top: 0,
                child: Container(

                    child: Image.asset("assets/Images/img_3.png"))),


            Positioned(
              top: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                        "Unlocking",
                      style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold, fontSize: 65

                    ),
                    ),Text(
                        "Financial Clarity ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40

                    ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        "with EMI",
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 40

                    ),
                    ),

                    SizedBox(height: 20,),
                    Text(
                    "Our smart EMI Calculator will help you in personal ",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11

                  ),
                    ),
                    SizedBox(height: 5,),

                    Text(
                    "finance and lending scenarios",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11

                  ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 40,
              right: 20,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Icon(Icons.navigate_next, color: Color.fromRGBO(220, 190, 190, 1), size: 50,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white



                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
