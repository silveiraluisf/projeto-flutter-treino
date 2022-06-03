import 'package:flutter/material.dart';
import 'package:my_app/screens/transferencia/lista.dart';

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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.savings_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListaTransferencias(),
              ));
              },
            ),
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
            children: const <Widget>[
              ElevatedButton(
                onPressed: null,
                child: Text('Botão'),
              ),
              Text('Teste de texto'),
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
