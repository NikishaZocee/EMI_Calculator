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
  int principal = 0; // Set principal amount to 0
  double interestRate = 0.0; // Set interest rate to 0.0
  int tenureInMonths = 0; // Set tenure in months to 0

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
      interestRateController.text = value.toStringAsFixed(0); // Display as integer
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

      body: SingleChildScrollView(

        padding: EdgeInsets.all(16.0),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: 70),

            Center(
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
                            color: Colors.white70,
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
                                        colors: [Colors.lightBlueAccent, Colors.white],

                                      ).createShader(rect);
                                    },
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        height: 160,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white60
                                        ),
                                      ),
                                    )
                                  ],
                                ),),
                            )
                        );
                      },
                    ),
                    Center(
                      child: Text(
                        'Rs.${_calculateEMI().toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                        style: TextStyle(fontSize: 18),
                      ),
                      Slider(
                        value: principal.toDouble(),
                        min: 0,
                        max: 5000000,
                        divisions: 200, // Reduced the divisions for smooth slider movement
                        onChanged: (value) => _updatePrincipal(value.round()), // Round the value to an integer
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
                      onChanged: (text) {
                        if (text.isEmpty) return;
                        int value = int.tryParse(text) ?? 0;
                        if (value > 0) {
                          _updatePrincipal(value);
                        }
                      },
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
                        style: TextStyle(fontSize: 18),
                      ),
                      Slider(
                        value: interestRate,
                        min: 0,
                        max: 20,
                        divisions: 20,
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
                      onChanged: (text) {
                        if (text.isEmpty) return;
                        double value = double.tryParse(text) ?? 0;
                        if (value > 0) {
                          _updateInterestRate(value);
                        }
                      },
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
                        style: TextStyle(fontSize: 18),
                      ),
                      Slider(
                        value: tenureInMonths.toDouble(),
                        min: 0,
                        max: 60,
                        divisions: 54, // Reduced the divisions for smooth slider movement
                        onChanged: (value) => _updateTenure(value.round()), // Round the value to an integer
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
                      onChanged: (text) {
                        if (text.isEmpty) return;
                        int value = int.tryParse(text) ?? 0;
                        if (value > 0) {
                          _updateTenure(value);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
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
                              child: Text("Okay"))
                        ],
                      ),
                    );
                  });
                }
              },
              child: Text('EMI Details'),
            ),
          ],
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
            shape: BoxShape.circle,
            color: percentage == 0 ? Colors.transparent : Colors.blueAccent,
          ),
          child: Center(
            child: Text(
              'Rs.${amount.toStringAsFixed(0)}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
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
