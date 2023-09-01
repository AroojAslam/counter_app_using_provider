import 'dart:math';
import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier{
  double per=0;
  int _count =0;
  int get count => _count;
void setCount(){
  if (_count==100){
    _count=0;
  }
  _count++;
  notifyListeners();
 }
void percent(){
  per = (_count/100);
  notifyListeners();
}
}
