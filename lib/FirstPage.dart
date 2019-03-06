import 'package:flutter/material.dart';
import 'package:flutter_app/SecondPage.dart';

class FirstPage extends StatefulWidget {
  final List<String> list = [];

  @override
  _FirstPageState createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, i) {
              return _FirstPageItem(
                data: '第' + i.toString() + '条信息', position: i,);
            }),
      ),
    );
  }

}

class _FirstPageItem extends StatefulWidget {
  final String data;
  final int position;

  _FirstPageItem({Key key, this.data, this.position});

  @override
  _FirstPageItemState createState() {
    return _FirstPageItemState();
  }

}

class _FirstPageItemState extends State<_FirstPageItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.position == 0) {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new SecondPage(),
            ),
          );
        } else {

        }
      },
      child: Text(
        widget.data,
        style: new TextStyle(fontSize: 14, height: 4,),
        textAlign: TextAlign.center,
      ),
    );
  }

}
