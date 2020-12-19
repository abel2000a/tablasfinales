import 'dart:async';

class Ticker{

  Stream<int> tick(){
  return Stream.periodic(const Duration(seconds: 30), (x)=>x).take(20);
  }

}