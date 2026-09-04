import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget {
  const TelaJogoHeroi({super.key});

  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();
}

class TelaJogoHeroiState extends State<TelaJogoHeroi> {
  String nomeHeroi = "";
  String titulo = "";
  int vida = 0;
  int moedas = 0;
  int poder = 0;
  int inteligencia = 0;
  String urlImagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Selecione seu Herói"),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => escolhaHeroi("Guerreiro"),
                  child: Text("Guerreiro"),
                ),
                ElevatedButton(
                  onPressed: () => escolhaHeroi("Ladino"),
                  child: Text("Ladino"),
                ),
                ElevatedButton(
                  onPressed: () => escolhaHeroi("Mago"),
                  child: Text("Mago"),
                ),
              ],
            ),
            Image.network(urlImagem),
            Card(
              elevation: 5, // Dá uma sombra 3D ao cartão
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Classe: $nomeHeroi',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    'Classe: $nomeHeroi',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(
                      'titulo: $titulo',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(), // Linha divisória
                    Text(
                      '❤️ Vida: $vida',
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    Text(
                      '💰 Moedas: $moedas',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      '⚔️ Poder: $poder',
                      style: const TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    Text(
                      '🧠 Poder: $inteligencia',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 51, 255, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void escolhaHeroi(String tipoHeroi) {
    setState(() {
      if (tipoHeroi == "Guerreiro") {
        nomeHeroi = "Jair M. Bolsonaro";
        titulo = "O patriota caído";
        vida = 200;
        moedas = 22222;
        poder = 70;
        inteligencia = 50;
        urlImagem =
            "https://thumb.wikimedia.org/wikipedia/commons/thumb/3/37/Jair_Bolsonaro_2019_Portrait_%283x4_cropped_center%29.jpg/330px-Jair_Bolsonaro_2019_Portrait_%283x4_cropped_center%29.jpg?utm_source=pt.wikipedia.org&utm_campaign=parser&utm_content=thumbnail";
      } else if (tipoHeroi == "Ladino") {
        nomeHeroi = "Flávio Bolsonaro";
        titulo = "Son of Patriotsm";
        vida = 100;
        moedas = 2222222;
        poder = 150;
        inteligencia = -1;
        urlImagem =
            "https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/8d1a/live/f611e8b0-5566-11f1-ab55-37e8d4cd836a.jpg.webp";
      } else if (tipoHeroi == "Mago") {
        nomeHeroi = "Daniel Vorcaro";
        titulo = "O mago do dinheiro";
        vida = 80;
        moedas = 999999;
        poder = 300;
        inteligencia = 1000;
        urlImagem =
            "https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2026/02/Daniel-Vorcaro.png?w=1000";
      }
    });
  }
}
