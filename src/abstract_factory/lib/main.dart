import 'package:abstract_factory/factories.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  AbstractFactory _factory = TextTabFactory();

  void _changeFactory() {
    setState(() {
      _textFactory = !_textFactory;
      _factory = _textFactory ? TextTabFactory() : IconTabFactory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tab1 = _factory.createTab1();
    final tab2 = _factory.createTab2();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: tab1.getTitle(context)),
                Tab(icon: tab2.getTitle(context)),
              ],
            ),
            title: const Text('Abstract Factory Demo'),
          ),
          body: TabBarView(
            children: [
              _factory.createTab1().getMainWidget(context),
              _factory.createTab2().getMainWidget(context),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _changeFactory,
            tooltip: 'Switch factory',
            child: const Icon(Icons.switch_access_shortcut),
          )),
    );
  }
}
