import 'package:flutter/material.dart';
import 'package:flutter_app/TestPage.dart';

class SecondPage extends StatefulWidget {

  @override
  _SecondPageState createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
        centerTitle: true,
      ),
      body: Center(
        child: /*InkResponse(
          child: Text(
              'Hello World!',
              style: new TextStyle(fontSize: 14, height: 2)),
          onTap: () => Navigator.pop(context),
        ),*/
        Column(
          children: <Widget>[
            InkResponse(
              child: Container(
                  child: Center(
                    child: Text(
                        'Hello World!',
                        style: new TextStyle(fontSize: 14, height: 2)),
                  )),
              onTap: () => Navigator.pop(context),
            )
            ,
            InkResponse(
              child: Text(
                  'jump to test ',
                  style: new TextStyle (fontSize: 14, height: 2)
              ),
              onTap: () =>
                  Navigator.push(context,
                      new MaterialPageRoute(
                          builder: (context) => new TestPage())),
            )
          ]
          ,
        )
        ,
      )
      ,
    );
  }
}
