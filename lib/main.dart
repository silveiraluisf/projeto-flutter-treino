import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}


class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando trasferência'),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 24.0,
                ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000-00'
                ),
              keyboardType: TextInputType.number,
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24.0,
                ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '000.00'
                ),
              keyboardType: TextInputType.number,
              ),
          ),


          ElevatedButton(
            onPressed: () {
              debugPrint('clicou');
              //debugPrint(_controladorCampoNumeroConta.text);
              //debugPrint(_controladorCampoValor.text);
              final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor = double.tryParse(_controladorCampoValor.text);
              if(numeroConta != null && valor != null){
              final transferenciaCriada =  Transferencia(valor, numeroConta);
              debugPrint('$transferenciaCriada');
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                      content: Text('$transferenciaCriada'),
                  ),
              );
              }

            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(230.0, 1045)),
          ItemTransferencia(Transferencia(109.0, 1555)),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
    );
  }
  }

  class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
  }

  class Transferencia {
    final double valor;
    final int numeroConta;

    Transferencia(this.valor, this.numeroConta);

    @override
    String toString() {
    // TODO: implement toString
      return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
  }




