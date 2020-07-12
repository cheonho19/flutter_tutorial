import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  title: 'Navigation',
  home: Scaffold(
    appBar: AppBar(
      title: Text('TapBox'),
    ),
    body: Center(
      child: ParentWidget(),
    ),
  ),
));

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  @override
  Widget build(BuildContext context) => Container(
    child: TapBoxC(
      active: _active,
      onChanged: _handleTapBoxChanged,
    ),
  );

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
}

class TapBoxC extends StatefulWidget {
  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  _TapBoxCState({ Key key, this.active: false, @required this.onChanged });
     // : assert(active != false),
        //assert(onChanged != null),
        //super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  bool _highlight = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: _handleTapDown,
    onTapUp: _handleTapUp,
    onTapCancel: _handleTapCancel,
    onTap: _handleTap,
    child: Container(
      child: Text(widget.active ? 'Active' : 'Inactive', style: TextStyle(
        fontSize: 32.0,
        color: Colors.white,
      )),
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
        border: _highlight ? Border.all(
          color: Colors.teal[700],
          width: 10.0,
        ) : null,
      ),
    ),
  );

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap() {
    widget.onChanged(!widget.active);
  }
}
