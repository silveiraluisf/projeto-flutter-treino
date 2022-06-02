import 'package:flutter/material.dart';

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
      bottomNavigationBar: const SizedBox(
        height: 50.0,
        child: BottomAppBar(
          color: Colors.blueGrey,
          child: IconButton(
            icon: Icon(Icons.home_filled),
            onPressed: null
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
          child: Icon(Icons.savings_outlined),
            onPressed: null,
            ),
      body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ElevatedButton(
                onPressed: null,
                child: Text('Incrementar'),
              ),
              Text('Teste de texto'),
            ]
          ),          //child:
        ),
      );
    }
  }
  

