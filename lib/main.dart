import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.redAccent[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage()
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 String p1 ;
  String r1;
  String n1;
  String _finalEmi = "";
@override
Widget build(BuildContext context)
{
  return Scaffold(
    appBar: AppBar(
      title:Text("EMI CALCULATOR"),
     elevation: 0.3
    ),
    body: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                onChanged: (value) => p1 = value ,
                decoration: InputDecoration(
                  labelText: "Enter Principal Amount"
                ),
                keyboardType: TextInputType.number,
              )
            ),

            Container(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                onChanged: (value) => r1 = value ,
                decoration: InputDecoration(
                    labelText: "Enter Interest Rate"
                ),
                keyboardType: TextInputType.number,
              )
            ),

            Container(
                padding: EdgeInsets.all(25.0),
                child: TextField(
                  onChanged: (value) =>n1 = value,
                  decoration: InputDecoration(
                      labelText: "Enter no. of Months."
                  ),
                  keyboardType: TextInputType.number,
                )
            ),
            
            FlatButton(onPressed: _emiCalc, child: Text("Calculate EMI(s)"),
            color: Colors.redAccent[400],padding: EdgeInsets.all(10.0)
            ),
            
            _finalEmiWidget(_finalEmi)

          ],
        ),
      ),
    ),
  );
}

  void _emiCalc() {
    double a =0.0;
double p = double.parse(p1);
double r = double.parse(r1)/12/100;
double n = double.parse(n1);


a= (p*r*pow(1+r,n))/(pow(1+r,n)-1);

  _finalEmi=a.toStringAsFixed(2);
setState(() {

});

}


  Widget _finalEmiWidget(finalEmi) {
  bool canShow =false;
  String _finalEmi = finalEmi;
  if(_finalEmi.length>0)
    {
      canShow=true;
    }
  return
    Container(
        margin: EdgeInsets.only(top :25.0),
        child: canShow?Column(
        children:[
          Text("Your Monthly Emi is",
          style: TextStyle(color: Colors.black,
        fontSize:20  ,fontWeight: FontWeight.bold
          )
          ),
          Container(color: Colors.blue,
              child: Text(_finalEmi,
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold
                  ))
          )
        ]
        ) : Container()
    );
  }
}
