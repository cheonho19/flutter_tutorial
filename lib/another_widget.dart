import 'package:flutter/material.dart';
import 'package:flutter_tutorial/my_widget.dart';
import 'ImportantData.dart';
import 'yet_another_widget.dart';

class AnotherWidget extends StatefulWidget {
  final ImportantData importantData;

  AnotherWidget({Key key, @required this.importantData})
      : assert(importantData != null),
        super(key: key);

  @override
  AnotherWidgetState createState() => AnotherWidgetState();
}

class AnotherWidgetState extends State<AnotherWidget> {
  ImportantData get _importantData => widget.importantData;

  @override
  Widget build(BuildContext context) {
    final MyWidget myWidget = context.ancestorWidgetOfExactType(MyWidget);
    //debugPrint("AnotherWidget is built");
    return Container(
        height: 400,
        decoration: BoxDecoration(color: Colors.cyan),
        child: Column(children: <Widget>[
          Text("AnotherWidget"),
          Text("Parent Direct Reference ${myWidget.state?.importantData?.count ?? "empty"}"),
          YetAnotherWidget(importantData: _importantData)
        ]));
  }
}
