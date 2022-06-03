import 'package:flutter/material.dart';

class BotaoHome extends StatelessWidget {
  final String? texto;
  final IconData? icone;

  const BotaoHome(
      {
        this.texto,
        this.icone
    });

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Text(texto!),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(icone!),
            ),
        ]
        ),
        );
      }
    }
