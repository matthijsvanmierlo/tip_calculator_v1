import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget{
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TipCalculatorState();
  }

}

class TipCalculatorState extends State<TipCalculator>{
  static const h1style = TextStyle(
    fontSize: 25,
    fontFamily: 'Arial',
    color: Colors.blue,
  );

  static const h2style = TextStyle(
    fontSize: 18,
    fontFamily: 'Arial',
    color: Colors.blue,
  );

  static const h2styleblack = TextStyle(
    fontSize: 18,
    fontFamily: 'Arial',
    color: Colors.black,
  );


  static const h2stylewhite = TextStyle(
    fontSize: 25,
    fontFamily: 'Arial',
    color: Colors.white,
  );

  final amountController = TextEditingController();
  final tipController = TextEditingController();
  var amtString = "0.00";
  var tipString = "0.00";

  void calcResult(){
    // TODO error checking for type of input with regex
    if(amountController.text != "" && tipController.text != "") {
      var amt = double.parse(amountController.text);
      var tip = double.parse(tipController.text);
      var tipAmt = amt * tip / 100;
      var total = amt + amt * tip / 100;
      setState(() {
        amtString = total.toStringAsFixed(2);
        tipString = tipAmt.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          Container(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: const BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Center(child: Text("Enter amount", style: h2stylewhite,)),
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          ),
          Container(
            child: Row(
              children: [
                const Expanded(child: Text("Amount (\$)", style: h1style), flex: 1),
                Expanded(child: TextField(keyboardType: TextInputType.number, controller: amountController, inputFormatters: [],), flex: 1)
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          Container(
            child: Row(
              children: [
                const Expanded(child: Text("Tip (%)", style: h1style), flex: 1),
                Expanded(child: TextField(keyboardType: TextInputType.number, controller: tipController,), flex: 1)
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            decoration: const BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Center(child: Text("Calculations", style: h2stylewhite,)),
          ),
          Container(
            child: Row(
              children: [
                ElevatedButton(onPressed: calcResult, child: const Text("Calculate", style: TextStyle(fontSize: 25),)),
                const Expanded(child: Center(child: Text("Total: ", style: h2style,))),
                Center(child: Text(amtString, style: h2styleblack,)),
                const Expanded(child: Center(child: Text("Tip: ", style:  h2style,))),
                Center(child: Text(tipString, style: h2styleblack)),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ],
      ),
    );
  }

}