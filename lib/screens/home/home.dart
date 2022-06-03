import 'package:flutter/material.dart';
import 'package:my_app/screens/transferencia/lista.dart';
import 'package:my_app/screens/contato/formulario_contatos.dart';
import 'package:my_app/components/botao_home.dart';

const _textoBotaoContato = 'Lista de Contatos';
const _textoBotaoTransferencias = 'Lista de Transferências';
const _tituloAppBar = 'Home';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Tela de home que direciona para a tela de transferência ou formulário
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
              icon: Icon(Icons.menu),
              onPressed: null
        ),
        title: const Text(
            _tituloAppBar
        ),
      ),
      bottomNavigationBar: const BottomNavigatorBar(),
      body: const HomeBody()
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ListaContatos()
                    ));},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BotaoHome(
                      texto: _textoBotaoContato,
                      icone: Icons.contacts,
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ListaTransferencias()
                  ));},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BotaoHome(
                      texto: _textoBotaoTransferencias,
                      icone: Icons.monetization_on,
                    )
                  ),
                ),
              )
            ]
        ),          //child:
      );
  }
}

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BottomAppBar(
        color: Colors.blueGrey,
        child:
          Row(
            children: const <Widget>[
              IconButton(
                icon: Icon(Icons.home_filled),
                onPressed: null
              ),
              IconButton(
              onPressed: null,
              icon: Icon(Icons.qr_code)),
            ],
          ),
      );
  }
}



