import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS SISTEM MOBILE',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _colorNotifier = ValueNotifier(Colors.green);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text('COLOR PICKER'),
        ),
      ),
    
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(
          30
          ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0,4),
              ),
            ]
          ),
          child: 
            Padding(padding: EdgeInsets.all(20),
            child: ValueListenableBuilder<Color>(
              valueListenable: _colorNotifier,
              builder: (_, color, __) {
                return ColorPicker(
                  color: color,
                  onChanged: (value) => color = value,
                );
              }
            ),
            ),
        ),
      ),
    ),
    );
  }
}