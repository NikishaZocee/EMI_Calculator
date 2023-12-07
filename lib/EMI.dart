import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(EMICalculatorApp());
}
class EMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMI Calculator',
      debugShowCheckedModeBanner: false,
      home: EMICalculatorPage(),
    );
  }
}
class EMICalculatorPage extends StatefulWidget {
  @override
  _EMICalculatorPageState createState() => _EMICalculatorPageState();
}

class _EMICalculatorPageState extends State<EMICalculatorPage> {
  int principal = 0;
  double interestRate = 0.0;
  int tenureInMonths = 0;

  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController tenureController = TextEditingController();

  @override
  void initState() {
    super.initState();
    principalController.text = '0';
    interestRateController.text = '0';
    tenureController.text = '0';
  }


  void _updatePrincipal(int value) {
    setState(() {
      principal = value;
      principalController.text = value.toString();
    });
  }

  void _updateInterestRate(double value) {
    setState(() {
      interestRate = value;
      interestRateController.text = value.toStringAsFixed(0);
    });
  }

  void _updateTenure(int value) {
    setState(() {
      tenureInMonths = value;
      tenureController.text = value.toString();
    });
  }

  double _calculateEMI() {
    double monthlyInterest = interestRate / (12 * 100);
    double emi = (principal * monthlyInterest *
        pow(1 + monthlyInterest, tenureInMonths)) /
        (pow(1 + monthlyInterest, tenureInMonths) - 1);
    return emi;
  }


  void _calculateAndShowEMI() {
    double emi = _calculateEMI();
    double totalAmount = emi * tenureInMonths;
    double totalInterest = totalAmount - principal;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('EMI Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Loan Amount: Rs.${principal.toStringAsFixed(0)}'),
              SizedBox(height: 8),
              Text('Interest Rate: ${interestRate.toStringAsFixed(2)}%'),
              SizedBox(height: 8),
              Text('Loan Tenure: $tenureInMonths months'),
              SizedBox(height: 16),
              Text('EMI: Rs.${emi.toStringAsFixed(2)}'),
              SizedBox(height: 8),
              Text('Total Amount: Rs.${totalAmount.toStringAsFixed(0)}'),
              SizedBox(height: 8),
              Text('Total Interest: Rs.${totalInterest.toStringAsFixed(0)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(249, 180, 171, 100),
          height: double.infinity,

          child: SingleChildScrollView(


            padding: EdgeInsets.all(16.0),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                SizedBox(height: 70),

                Center(
                  child: Container(
                    width: 400,
                    height: 230,
                    decoration: BoxDecoration( color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 200,
                      height: 200,

                      child: Stack(
                        children: [
                          TweenAnimationBuilder(
                            tween: Tween(
                              begin: 0.0,
                              end: 1.0,
                            ),
                            duration: Duration(seconds: 7),
                            builder: (context, value, child){
                              return Container(

                                  child: Center(
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      child: Stack(
                                        children: [
                                          ShaderMask(shaderCallback: (rect){
                                            return SweepGradient(
                                              startAngle: 0.0,
                                              endAngle: 3.14*2,
                                              stops: [value, value],
                                              center: Alignment.center,
                                              colors: [Colors.red, Colors.white54],

                                            ).createShader(rect);
                                          },
                                            child: Container(
                                              height: 200,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              height: 160,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromRGBO(246, 108, 108, 80),
                                                    spreadRadius: 1,
                                                    blurRadius:10,
                                                  )
                                                ],
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(249, 180, 171, 250),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              );
                            },
                          ),
                          Center(
                            child: Text(
                              'Rs.${_calculateEMI().toStringAsFixed(0)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPieItem('Interest', _calculateEMI() * tenureInMonths - principal, principal / (_calculateEMI() * tenureInMonths) * 100),
                    _buildPieItem('Principal', principal.toDouble(), (_calculateEMI() * tenureInMonths - principal) / (_calculateEMI() * tenureInMonths) * 100),
                  ],
                ),
                SizedBox(height: 30),
                



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Loan Amount:',
                            style: TextStyle(fontSize: 18, color:  Colors.black, fontWeight: FontWeight.normal ),
                          ),
                          Slider(
                            activeColor: Colors.red,
                            inactiveColor: Colors.white,
                            value: principal.toDouble(),
                            min: 0,
                            max: 5000000,
                            divisions: 200,
                            label: principal.toString(),

                            onChanged: (value) => _updatePrincipal(value.round()),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          controller: principalController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            border: OutlineInputBorder(),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Interest Rate:',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Slider(
                            activeColor: Colors.red,
                            inactiveColor: Colors.white,
                            value: interestRate,
                            min: 0,
                            max: 20,
                            divisions: 20,
                            label: interestRate.toStringAsFixed(0),
                            onChanged: _updateInterestRate,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          controller: interestRateController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Rate (%)',
                            border: OutlineInputBorder(),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Loan Tenure:',
                            style: TextStyle(fontSize: 18, color: Colors.black, ),
                          ),
                          Slider(
                            activeColor: Colors.red,
                            inactiveColor: Colors.white,
                            value: tenureInMonths.toDouble(),
                            min: 0,
                            max: 60,
                            divisions: 54,
                            label: tenureInMonths.toString(),
                            onChanged: (value) => _updateTenure(value.round()),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          controller: tenureController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Tenure (months)',
                            border: OutlineInputBorder(),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      if (principal > 0 && interestRate > 0 && tenureInMonths > 0) {
                        _calculateAndShowEMI();
                      } else {
                        showDialog(context: context, builder: (context){
                          return Container(
                            child: AlertDialog(
                              title: Text("Please enter valid values"),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                    child: Text("Close"))
                              ],
                            ),
                          );
                        });
                      }
                    },
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 500,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius:10,
                              )
                            ],
                          borderRadius: BorderRadius.circular(10), color: Colors.red
                        ),

                        child: Center(child: Text('EMI Details', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        )
                        ),

                    ),
                  )



                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPieItem(String label, double amount, double percentage) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                spreadRadius: 1,
                blurRadius:10,
              )
            ],
            shape: BoxShape.circle,
            color: percentage == 0 ? Colors.transparent : Color.fromRGBO(249, 180, 171, 10),
          ),
          child: Center(
            child: Text(
              'Rs.${amount.toStringAsFixed(0)}',
              style: TextStyle(
                color: Color.fromRGBO(194, 20, 20, 50),
                fontWeight: FontWeight.bold
                ,
                fontSize: 12,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '$label\n${percentage.toStringAsFixed(0)}%',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
