import 'package:flutter/material.dart';

abstract class Tab1 {
  Widget getTitle(BuildContext context);
  Widget getMainWidget(BuildContext context);
}

abstract class Tab2 {
  Widget getTitle(BuildContext context);
  Widget getMainWidget(BuildContext context);
}

abstract class AbstractFactory {
  Tab1 createTab1();
  Tab2 createTab2();
}

class TextTab1 implements Tab1 {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Center(child: Text("Text Tab1"));
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Text("Text 1");
  }
}

class TextTab2 implements Tab2 {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Center(child: Text("Text Tab2"));
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Text("Text 2");
  }
}

class IconTab1 implements Tab1 {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Icon(Icons.directions_car);
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Icon(Icons.directions_car);
  }
}

class IconTab2 implements Tab2 {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Icon(Icons.directions_bike);
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Icon(Icons.directions_bike);
  }
}

class TextTabFactory implements AbstractFactory {
  @override
  Tab1 createTab1() {
    return TextTab1();
  }

  @override
  Tab2 createTab2() {
    return TextTab2();
  }
}

class IconTabFactory implements AbstractFactory {
  @override
  Tab1 createTab1() {
    return IconTab1();
  }

  @override
  Tab2 createTab2() {
    return IconTab2();
  }
}
