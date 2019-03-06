import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/TestModule.dart';

class TestItem extends StatefulWidget {
  final int index;
  final List<ItemData> list;
  final Function onClickRemove;
  final Function onClickAdd;


  const TestItem(
      {Key key, this.index, this.list, this.onClickRemove, this.onClickAdd})
      : super(key: key);

  @override
  _TestItemState createState() {
    return new _TestItemState();
  }
}

class _TestItemState extends State<TestItem> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController moneyController = new TextEditingController();
    moneyController.addListener(() {
      print(moneyController.text);
    });
    Widget result = Column(
      children: <Widget>[
        _firstLine(),
        Container(
          height: 38,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
          child:
          Row(
            children: <Widget>[
              Container(
                child:
                Text('付款金额：',),
                width: 110,
              ),
              Flexible(
                child:
                TextField(
                  style: TextStyle(
                      fontSize: 14, color: Colors.black),
                  controller: moneyController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(1, 4, 1, 4),
                    hintText: '请输入付款金额',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintStyle: new TextStyle(fontSize: 14),
                  ),
                  autofocus: false,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: <Widget>[
              Container(
                child:
                Text('付款账户户名：'),
                width: 110,
              ),
              Flexible(
                fit: FlexFit.tight,
                child:
                TextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(1, 4, 1, 4),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: '请输入付款账户户名',
                    hintStyle: new TextStyle(fontSize: 14),
                  ),
                  autofocus: false,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 38,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Row(
            children: <Widget>[
              Container(
                child:
                Text('付款时间：'),
                width: 110,
              ),
              Flexible(
                fit: FlexFit.tight,
                child:
                InkWell(
                  child:
                  Text('请选择付款时间',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  onTap: () {
                    print('请选择付款时间');
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(0, 0.5, 0, 0),
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child:
          MaterialButton(
            color: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.all(2),
            highlightColor: Colors.transparent,
            highlightElevation: 0,
            child:
            Image.asset('assets/pic_add_voucher.png', width: 100, height: 64,),
            onPressed: () {
              print('pic_add_voucher');
            },
          ),
        ),
        _addItem(),
        Container(
          height: 20,
        ),
      ],
    );
    return result;
  }

  _firstLine() {
    return new Container(
      color: Colors.white,
      height: 38,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0.5),
      child: new Row(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            width: 3,
            height: 20,
            margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
          ),
          Text(
            '付费凭证' + (widget.index + 1).toString(),
            style: new TextStyle(fontSize: 14, color: Colors.black),
          ),
          Spacer(flex: 1,),
          Offstage(
            offstage: widget.index == 0,
            child: Container(
              width: 40,
              height: 38,
              child: MaterialButton(
                height: 38,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  if (widget.onClickRemove != null) {
                    widget.onClickRemove(widget.index);
                  }
                },
                child: Icon(
                  Icons.delete, size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _addItem() {
    if (widget.index == widget.list.length - 1) {
      return Container(
        height: 56,
        margin: EdgeInsets.fromLTRB(0, 0.5, 0, 0),
        child: MaterialButton(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('添加打款凭证', style: new TextStyle(color: Colors.black),),
              Container(width: 5),
              Image.asset('assets/icon_add.png', width: 16, height: 16,)
            ],
          ),
          onPressed: () {
            if (widget.onClickAdd != null) {
              widget.onClickAdd();
            }
          },
        ),
      );
    } else {
      return new Container();
    }
  }

}