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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the display didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _display = '';
  String output = '';
  String _operator = '';
  double operand1 = 0.0;
  double operand2 = 0.0;
  bool _afterEquals = false;
  bool _dividByZero = false;

  void _incrementdisplay(String _pressed) {
    setState(() {
      if (_pressed == 'AC') {
        _display = '';
        output = '';
        _operator = '';
        operand1 = 0.0;
        operand2 = 0.0;
        return;
      }
      if (_pressed == '+' ||
          _pressed == '-' ||
          _pressed == '*' ||
          _pressed == '/') {
        output = _display + ' ' + _pressed + ' ';
        if (_display != '')
          operand1 = double.parse(_display);
        else
          operand1 = 0.0;
        _operator = _pressed;
        _display = '';
        return;
      }
      if (_pressed == '=') {
        operand2 = double.parse(_display);
        output += _display;
        if (_operator == '+') {
          _display = (operand1 + operand2).toString();
        }
        if (_operator == '-') {
          _display = (operand1 - operand2).toString();
        }
        if (_operator == '*') {
          _display = (operand1 * operand2).toString();
        }
        if (_operator == '/') {
          if (operand2 != 0.0)
            _display = (operand1 / operand2).toString();
          else {
            _dividByZero = true;
            _display = 'Can not divide by zero';
          }
        }
        _afterEquals = true;
        return;
      } else {
        if (_dividByZero) {
          _dividByZero = false;
        }
        if (_afterEquals) {
          output = '';
          _display = '';
          _afterEquals = false;
        }
        _display += _pressed;
        return;
      }
    });
  }

  _createFlatButton(String _symbol) {
    return Expanded(
        child: FlatButton(
      onPressed: () => _incrementdisplay(_symbol),
      child: Text(_symbol),
      textColor: Colors.white,
      color: Colors.lightBlue,
    ));
  }

  _createFlatButton2(String _symbol) {
    return Expanded(
      child: FlatButton(
        onPressed: () => _incrementdisplay(_symbol),
        child: Text(_symbol),
        textColor: Colors.white,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementdisplay method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$output',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_display',
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(child: Divider()),
            Row(children: [
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('7'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('8'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('9'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton2('/'),
              SizedBox(
                width: 10,
                height: 10,
              ),
            ]),
            Row(children: [
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('4'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('5'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('6'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton2('*'),
              SizedBox(
                width: 10,
                height: 10,
              ),
            ]),
            Row(children: [
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('1'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('2'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('3'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton2('-'),
              SizedBox(
                width: 10,
                height: 10,
              ),
            ]),
            Row(children: [
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton('0'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton2('AC'),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton2('='),
              SizedBox(
                width: 10,
                height: 10,
              ),
              _createFlatButton2('+'),
              SizedBox(
                width: 10,
                height: 10,
              ),
            ]),
            //
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
