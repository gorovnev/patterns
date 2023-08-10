import 'package:factory_method/factory_method.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Factory method demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _textFactory = true;
  AbstractCreator _creator = ListCreator();

  void _changeFactory() {
    setState(() {
      _textFactory = !_textFactory;
      _creator = _textFactory ? ListCreator() : GridCreator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: _creator.createContent().getContent(),
          floatingActionButton: FloatingActionButton(
            onPressed: _changeFactory,
            tooltip: 'Switch factory',
            child: const Icon(Icons.switch_access_shortcut),
          )),
    );
  }
}
