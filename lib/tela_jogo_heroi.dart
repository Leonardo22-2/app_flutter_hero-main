import 'package:flutter/material.dart';
import 'tela_de_gameplay.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                      onPressed: () {
                        escolhaHeroi("Guerreiro");
                      },
                      child: const Text("Guerreiro"),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        escolhaHeroi("Ladino");
                      },
                      child: const Text("Ladino"),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        escolhaHeroi("Mago");
                      },
                      child: const Text("Mago"),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // IMAGEM DO HERÓI
                if (urlImagem.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      urlImagem,
                      width: 200,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image, size: 100);
                      },
                    ),
                  ),

                const SizedBox(height: 20),

                // INFORMAÇÕES DO HERÓI
                if (nomeHeroi.isNotEmpty)
                  Card(
                    elevation: 5,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Nome: $nomeHeroi",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Título: $titulo",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Classe: $classe",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Divider(),

                          Text(
                            "❤️ Vida: $vida",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),

                          Text(
                            "💰 Moedas: $moedas",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                            ),
                          ),

                          Text(
                            "⚔️ Poder: $poder",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),

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

                const SizedBox(height: 20),

                // BOTÃO SELECIONAR
                ElevatedButton(
                  onPressed: nomeHeroi.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaDeGameplay(
                                heroi: nomeHeroi,
                                imagem: urlImagem,
                                vida: vida,
                                moedas: moedas,
                                poder: poder,
                                inteligencia: inteligencia,
                              ),
                            ),
                          );
                        },
                  child: const Text(
                    "Selecionar",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // FUNÇÃO PARA ESCOLHER O HERÓI
  void escolhaHeroi(String tipoHeroi) {
    setState(() {
      switch (tipoHeroi) {
        case "Guerreiro":
          classe = "Guerreiro";
          nomeHeroi = "Jair M. Bolsonaro";
          titulo = "O patriota caído";

          vida = 150;
          moedas = 2217;
          poder = 70;
          inteligencia = 50;

          urlImagem =
              "https://thumb.wikimedia.org/wikipedia/commons/thumb/3/37/Jair_Bolsonaro_2019_Portrait_%283x4_cropped_center%29.jpg/330px-Jair_Bolsonaro_2019_Portrait_%283x4_cropped_center%29.jpg";
          break;

        case "Ladino":
          classe = "Ladino";
          nomeHeroi = "Flávio Bolsonaro";
          titulo = "Son of Patriotsm";

          vida = 80;
          moedas = 222222;
          poder = 100;
          inteligencia = -1;

          urlImagem =
              "https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/8d1a/live/f611e8b0-5566-11f1-ab55-37e8d4cd836a.jpg.webp";
          break;

        case "Mago":
          classe = "Mago";
          nomeHeroi = "Daniel Vorcaro";
          titulo = "O mago do dinheiro";

          vida = 50;
          moedas = 99999999;
          poder = 300;
          inteligencia = 1000;

          urlImagem =
              "https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2026/02/Daniel-Vorcaro.png?w=1000";
          break;
      }
    });
  }
}
