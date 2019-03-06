import 'package:flutter/material.dart';
import 'package:flutter_app/TestItem.dart';
import 'package:flutter_app/TestModule.dart';

class TestPage extends StatefulWidget {
  final List<ItemData> list = [new ItemData()];

  @override
  _TestPageState createState() {
    return _TestPageState(list);
  }
}

class _TestPageState extends State<TestPage> {
  final List<ItemData> list;

  _TestPageState(this.list);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('上传凭证'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return InkResponse(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                  ),
                  Text(
                    '返回',
                    style: new TextStyle(fontSize: 16),
                  ),
                ],
              ),
              onTap: () => Navigator.maybePop(context),
            );
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      bottomNavigationBar:
      Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
        child: MaterialButton(
          color: Colors.yellow,
          child:
          Text('提  交',
              style: new TextStyle(color: Colors.black, fontSize: 18)
          ),
          onPressed: () {
            _toast(context, '点击了提交');
//            _showDialog(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: this.list == null ? 0 : this.list.length,
        itemBuilder: (BuildContext context, int index) {
          return new TestItem(
            index: index,
            list: this.list,
            onClickAdd: () {
              print('onClickAdd---');
              this.list.add(new ItemData());
              this.setState(() => {});
            },
            onClickRemove: (index) {
              print('onClickRemove---the index is ' + index.toString());
              this.list.removeAt(index);
              this.setState(() {});
            },
          );
        },
      ),
    );
  }

  _toast(BuildContext context, String msg) async {
    OverlayState overlayState = Overlay.of(context);
    double op = 1.0;
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: MediaQuery
            .of(context)
            .size
            .height * 2 / 3,
        child: AnimatedOpacity(
          child:
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(msg,
              style: TextStyle(fontSize: 16, color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
          opacity: op,
          duration: Duration(seconds: 1),
        ),
      );
    });
    overlayState.insert(overlayEntry);
    //等待2秒
    await Future.delayed(Duration(seconds: 2));
    //移除
    op = 0.0;
    overlayEntry.markNeedsBuild();
    //等待2秒
    await Future.delayed(Duration(seconds: 2));
    overlayEntry.remove();
  }

  _showDialog(BuildContext context) {
    if (context == null) {
      return;
    }
    showDialog(context: context, builder: (BuildContext context) {
      AlertDialog alertDialog = AlertDialog(
        title: Text('提示'),
        content: Text('点击了提示'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, true);
              Navigator.pop(context, true);
            },
          ),
          FlatButton(
            child: Text('确定'),
            onPressed: () {},
          ),
        ],
      );
      return alertDialog;
    });
  }

}