import 'package:flutter/material.dart';

class GlobalUtil {
  BuildContext _context;
  static GlobalUtil _mInstance;

  static GlobalUtil get(){
    if (_mInstance == null) {
      _mInstance = new GlobalUtil();
    }
    return _mInstance;
  }

  init(BuildContext context) {
    this._context = context;
  }

  getAppContext() {
    return this._context;
  }
}