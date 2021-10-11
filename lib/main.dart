import 'package:bloc_flutter/blocs/bloc_counter.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => bloc)],
      dependencies: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder(
                stream: bloc.contador,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  } else {
                    return Container();
                  }
                },
              ),
              Container(),
              ElevatedButton(
                onPressed: () =>
                    bloc.incrementar(),
                child: Text('Incrementar'),
              ),
              ElevatedButton(
                onPressed: () =>
                    bloc.decrementar(),
                child: Text('Decrementar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
