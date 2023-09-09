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
      home: EMICalculatorPage(),
    );
  }
}

class EMICalculatorPage extends StatefulWidget {
  @override
  _EMICalculatorPageState createState() => _EMICalculatorPageState();
}

class _EMICalculatorPageState extends State<EMICalculatorPage> {
  double principal = 100000; // Default principal amount
  double interestRate = 8.0; // Default interest rate
  double tenureInMonths = 12; // Default loan tenure in months

  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController tenureController = TextEditingController();

  @override
  void initState() {
    super.initState();
    principalController.text = principal.toString();
    interestRateController.text = interestRate.toString();
    tenureController.text = tenureInMonths.toString();
  }

  void _updatePrincipal(double value) {
    setState(() {
      principal = value;
      principalController.text = value.toString();
    });
  }

  void _updateInterestRate(double value) {
    setState(() {
      interestRate = value;
      interestRateController.text = value.toString();
    });
  }

  void _updateTenure(double value) {
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

  @override
  Widget build(BuildContext context) {
    double emi = _calculateEMI();

    // Calculate interest and principal amounts
    double totalAmount = emi * tenureInMonths;
    double totalInterest = totalAmount - principal;

    // Calculate percentage of interest and principal for the pie chart
    double interestPercentage = totalInterest / totalAmount * 100;
    double principalPercentage = 100 - interestPercentage;

    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                            color: Colors.white,
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
                        'Rs.${totalAmount.toStringAsFixed(0)}',
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
                _buildPieItem('Interest', totalInterest, interestPercentage),
                _buildPieItem('Principal', principal, principalPercentage),
              ],
            ),
            SizedBox(height: 40),
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
                        value: principal,
                        min: 10000,
                        max: 5000000,
                        divisions: 100,
                        onChanged: _updatePrincipal,
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
                        double value = double.tryParse(text) ?? 0;
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
                        min: 1,
                        max: 20,
                        divisions: 19,
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
                        value: tenureInMonths,
                        min: 6,
                        max: 60,
                        divisions: 24,
                        onChanged: _updateTenure,
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
                        double value = double.tryParse(text) ?? 0;
                        if (value > 0) {
                          _updateTenure(value);
                        }
                      },
                    ),
                  ),
                ),
              ],
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
