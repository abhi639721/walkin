import 'package:flutter/material.dart';



class CounterProvider extends ChangeNotifier{

  int  countVal =  0;


  increase(){
    countVal++;
        notifyListeners();
  }

  decrease(){
    countVal--;
    notifyListeners();
  }


}