import 'package:flutter/material.dart';
import 'package:my_app/models/contato.dart';

class ListaContatos extends StatelessWidget {

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorNumeroConta = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controladorNome,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controladorNumeroConta,
                decoration: const InputDecoration(labelText: 'Número da Conta'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                child: const Text('Adicionar Contato'),
                onPressed: () {
                  final String nome = _controladorNome.text;
                  final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
                  if(numeroConta != null){
                    final Contato contatoNovo = Contato(nome, numeroConta);}
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

