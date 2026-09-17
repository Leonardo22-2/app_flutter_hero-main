import 'package:flutter/material.dart';
import 'tela_jogo_heroi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const TelaInicial());
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('bolsonaroXlula.jpg', width: 1000),
            Text(
              'Caverna do Dragão',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaJogoHeroi()),
                );
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
