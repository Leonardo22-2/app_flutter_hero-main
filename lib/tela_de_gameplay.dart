import 'package:flutter/material.dart';

class TelaDeGameplay extends StatefulWidget {
  final String heroi;
  final String imagem;
  final int vida;
  final int moedas;
  final int poder;
  final int inteligencia;

  const TelaDeGameplay({
    super.key,
    required this.heroi,
    required this.imagem,
    required this.vida,
    required this.moedas,
    required this.poder,
    required this.inteligencia,
  });

  @override
  State<TelaDeGameplay> createState() => _TelaDeGameplayState();
}

class _TelaDeGameplayState extends State<TelaDeGameplay> {
  double posicaoHorizontal = 40;
  double alturaPulo = 0;

  int miliss = 200;
  bool pulando = false;

  void andarParaDireita() {
    setState(() {
      posicaoHorizontal += 40;
    });
  }

  void andarParaEsquerda() {
    setState(() {
      if (posicaoHorizontal > 10) {
        posicaoHorizontal -= 40;
      }
    });
  }

  void pular() {
    // Impede de apertar várias vezes enquanto está pulando
    if (pulando) return;

    setState(() {
      pulando = true;
      alturaPulo = 180;
      miliss = 300;
    });

    // Depois de subir, começa a descer
    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;

      setState(() {
        alturaPulo = 0;
        miliss = 300;
      });

      // Libera o próximo pulo
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (!mounted) return;

        setState(() {
          pulando = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // FUNDO
          Positioned.fill(
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDBWm31jaWt-tuAZx5f2-ZVA80ZWC2RSeCByRH33A3vMioH2bZeAIKNjs&s=10",
              fit: BoxFit.cover,
            ),
          ),

          // INFORMAÇÕES DO HERÓI
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.heroi,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "❤️ Vida: ${widget.vida}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  Text(
                    "💰 Moedas: ${widget.moedas}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  Text(
                    "⚔️ Poder: ${widget.poder}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  Text(
                    "🧠 Inteligência: ${widget.inteligencia}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),

          // PERSONAGEM
          AnimatedPositioned(
            duration: Duration(milliseconds: miliss),
            curve: Curves.easeOut,
            left: posicaoHorizontal,
            bottom: 120 + alturaPulo,
            child: Image.network(
              widget.imagem,
              height: 130,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.white,
                );
              },
            ),
          ),

          // BOTÃO ESQUERDA
          Positioned(
            bottom: 30,
            left: 30,
            child: ElevatedButton(
              onPressed: andarParaEsquerda,
              child: const Text("⬅ Esquerda", style: TextStyle(fontSize: 18)),
            ),
          ),

          // BOTÃO PULAR
          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: ElevatedButton(
              onPressed: pular,
              child: const Text("Pular ⬆", style: TextStyle(fontSize: 18)),
            ),
          ),

          // BOTÃO DIREITA
          Positioned(
            bottom: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: andarParaDireita,
              child: const Text("Direita ➡", style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
