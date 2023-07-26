import 'package:flutter/material.dart';

abstract class AbstractTab {
  Widget getTitle(BuildContext context);
  Widget getMainWidget(BuildContext context);
}

class TextTab1 implements AbstractTab {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Center(child: Text("Text Tab1"));
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Text("Text 1");
  }
}

class TextTab2 implements AbstractTab {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Center(child: Text("Text Tab2"));
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Text("Text 2");
  }
}

class IconTab1 implements AbstractTab {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Icon(Icons.directions_car);
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Icon(Icons.directions_car);
  }
}

class IconTab2 implements AbstractTab {
  @override
  Widget getMainWidget(BuildContext context) {
    return const Icon(Icons.directions_bike);
  }

  @override
  Widget getTitle(BuildContext context) {
    return const Icon(Icons.directions_bike);
  }
}

abstract class TabBuider {
  AbstractTab getTab1();
  AbstractTab getTab2();
}

class TextTabBuilder implements TabBuider {
  @override
  AbstractTab getTab1() {
    return TextTab1();
  }

  @override
  AbstractTab getTab2() {
    return TextTab2();
  }
}

class IconTabBuilder implements TabBuider {
  @override
  AbstractTab getTab1() {
    return IconTab1();
  }

  @override
  AbstractTab getTab2() {
    return IconTab2();
  }
}
