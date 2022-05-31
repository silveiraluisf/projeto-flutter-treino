import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando trasferência'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Número da conta',
              dica: '0000-00'),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on),

            ElevatedButton(
              child: const Text('Confirmar'),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
         ),
        ),
      );
    }
      void _criaTransferencia(BuildContext context) {
        final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
        final double? valor = double.tryParse(_controladorCampoValor.text);
        if(numeroConta != null && valor != null){
          final transferenciaCriada =  Transferencia(valor, numeroConta);
          debugPrint('Criando Transferência');
          debugPrint('$transferenciaCriada');
          Navigator.pop(context, transferenciaCriada);
          }
        }
    }

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  const Editor(
      {
        this.controlador,
        this.rotulo,
        this.dica,
        this.icone
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencias = [];
    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return ListaTransferenciasState();
    }
  }


  class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
  // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
        }));
      future.then((transferenviaRecebida) {
        debugPrint('chegou no then future');
        debugPrint('$transferenviaRecebida');
        if (transferenviaRecebida != null) {
        setState(() {
          widget._transferencias.add(transferenviaRecebida);
        });}
      });
      },
      ),
    );
    }
  }

  class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
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




