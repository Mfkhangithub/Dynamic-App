import 'package:flutter/material.dart';
import 'package:saloonstore/components/My_Drawer.dart';

class Tablet_home_page extends StatefulWidget {
  const Tablet_home_page({super.key});

  @override
  State<Tablet_home_page> createState() => _Tablet_home_pageState();
}

class _Tablet_home_pageState extends State<Tablet_home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tablet")),
      drawer: const MyDrawer(),
    );
  }
}
