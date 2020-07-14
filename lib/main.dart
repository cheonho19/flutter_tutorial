import 'package:flutter/material.dart';
import 'package:flutter_tutorial/no_ref_to_important_data_widget.dart';
import 'my_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  GlobalKey<MyWidgetState> myWidgetState = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp is built");
    return MaterialApp(
      title: 'InheritedWidgetSample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('InheritedWidget')),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("MyWidget"),
              MyWidget(key: myWidgetState),
              NoRefToImportantDataWidget()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myWidgetState.currentState.doImportantThings();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
        ),
        backgroundColor: Colors.green,
      ));
  }
}
