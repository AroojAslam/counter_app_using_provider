import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier{
  var _generatedColor=0;
  get generatedColor => _generatedColor;
  int _count =0;
  int get count => _count;
void setCount(){
  _count++;
  notifyListeners();
 }
 void setcolor(){
  _generatedColor = Random().nextInt(Colors.primaries.length);
  notifyListeners();
 }

}
