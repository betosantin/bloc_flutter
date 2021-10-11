import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class CounterBloc extends BlocBase {
  int _counter = 0;

  final _controller = StreamController<int>();
  Stream get contador => _controller.stream;

  CounterBloc() {
  }

  void incrementar() {
    this._counter ++;

    this._controller.sink.add(this._counter);
  }

  void decrementar(){
    this._counter --;
    this._controller.sink.add(this._counter);
  }

  @override
  void dispose() {
    this._controller.close();
    
    super.dispose();
  }
}
