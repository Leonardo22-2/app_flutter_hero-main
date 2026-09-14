import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget {
  const TelaJogoHeroi({super.key});

  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();
}

class TelaJogoHeroiState extends State<TelaJogoHeroi> {
  String nomeHeroi = "";
  String titulo = "";
  String classe = "";

  int vida = 0;
  int moedas = 0;
  int poder = 0;
  int inteligencia = 0;

  String urlImagem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jogo dos Heróis")),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Selecione seu Herói",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // BOTÕES DOS HERÓIS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => escolhaHeroi("Guerreiro"),
                    child: const Text("Guerreiro"),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () => escolhaHeroi("Ladino"),
                    child: const Text("Ladino"),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () => escolhaHeroi("Mago"),
                    child: const Text("Mago"),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // IMAGEM DO HERÓI
              if (urlImagem.isNotEmpty)
                Image.network(
                  urlImagem,
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 100);
                  },
                ),

              const SizedBox(height: 20),

              // CARD COM AS INFORMAÇÕES
              if (nomeHeroi.isNotEmpty)
                Card(
                  elevation: 5,
                  color: Colors.grey[200],

                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      children: [
                        // NOME
                        Text(
                          "Nome: $nomeHeroi",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // TÍTULO
                        Text(
                          "Título: $titulo",
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // CLASSE
                        Text(
                          "Classe: $classe",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Divider(),

                        // VIDA
                        Text(
                          "❤️ Vida: $vida",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),

                        // MOEDAS
                        Text(
                          "💰 Moedas: $moedas",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.orange,
                          ),
                        ),

                        // PODER
                        Text(
                          "⚔️ Poder: $poder",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),

                        // INTELIGÊNCIA
                        Text(
                          "🧠 Inteligência: $inteligencia",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 51, 255, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaIniciar()),
                  );
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FUNÇÃO PARA ESCOLHER O HERÓI
  void escolhaHeroi(String tipoHeroi) {
    setState(() {
      if (tipoHeroi == "Guerreiro") {
        classe = "Guerreiro";
        nomeHeroi = "Jair M. Bolsonaro";
        titulo = "O patriota caído";

        vida = 200;
        moedas = 2222;
        poder = 70;
        inteligencia = 50;

        urlImagem =
            "https://thumb.wikimedia.org/wikipedia/commons/thumb/3/37/Jair_Bolsonaro_2019_Portrait_%283x4_cropped_center%29.jpg/330px-Jair_Bolsonaro_2019_Portrait_%283x4_cropped_center%29.jpg";
      } else if (tipoHeroi == "Ladino") {
        classe = "Ladino";
        nomeHeroi = "Flávio Bolsonaro";
        titulo = "Son of Patriotsm";

        vida = 100;
        moedas = 222222;
        poder = 150;
        inteligencia = -1;

        urlImagem =
            "https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/8d1a/live/f611e8b0-5566-11f1-ab55-37e8d4cd836a.jpg.webp";
      } else if (tipoHeroi == "Mago") {
        classe = "Mago";
        nomeHeroi = "Daniel Vorcaro";
        titulo = "O mago do dinheiro";

        vida = 80;
        moedas = 99999999;
        poder = 300;
        inteligencia = 1000;

        urlImagem =
            "https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2026/02/Daniel-Vorcaro.png?w=1000";
      }
    });
  }
}
