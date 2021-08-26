import 'package:flutter/material.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String? _text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _text = value;
                    });
                  },
                )),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_text);
              },
              child: Text('追加'),
            )
          ],
        ),
      ),
    );
  }
}
