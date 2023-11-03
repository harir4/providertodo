import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertodo/modelclass/providerclass.dart';
import 'package:providertodo/screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Provider_class(),
    child: MaterialApp(
      home: Home(),
    ),
  ));
}
