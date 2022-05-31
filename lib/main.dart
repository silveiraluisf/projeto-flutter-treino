import 'package:flutter/material.dart';
import 'package:my_app/screens/transferencia/lista.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.blueAccent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.redAccent[700],
          )),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[400],
          textTheme: ButtonTextTheme.primary)),
      home:  ListaTransferencias(),
      );
  }
}




