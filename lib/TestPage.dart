import 'package:flutter/material.dart';
import 'package:flutter_app/util/CustomDialog.dart';
import 'package:flutter_app/TestItem.dart';
import 'package:flutter_app/TestModule.dart';
import 'package:flutter_app/util/CustomToast.dart';

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
//            _showDialog();
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
    toast(context, '第一条');
    print('第一条:' + context.toString());
    print('第一条:' + context.owner.toString());
    await Future.delayed(Duration(milliseconds: 500));
    toast(context, '第二条');
    print('第二条:' + context.toString());
    print('第二条:' + context.owner.toString());
    await Future.delayed(Duration(milliseconds: 500));
    if(context==null){
      print('第三条:context==null');
      return;
    }
    print('第三条:' + context.owner.toString());
    toast(context, '第三条');
  }

  int i = 1;

  _showDialog() {
    showDialog(context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return
            CustomDialog(
                cancelable: true,
                contentPadding: EdgeInsets.all(0),
                onDismiss: () {
                  print('onDismiss');
                },
                child:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child:
                        Text('标题', style: TextStyle(fontSize: 16))),
                    Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                        child:
                        Text('内容', style: TextStyle(fontSize: 14))
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child:
                          Container(
                            height: 44,
                            child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                child: Text('取消'),
                                color: Colors.yellow,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child:
                          Container(
                            height: 44,
                            child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                child: Text('确定'),
                                color: Colors.yellow,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            );
        });
  }

}