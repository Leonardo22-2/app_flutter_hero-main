import 'package:flutter/material.dart';

class TelaDeGameplay extends StatefulWidget {
  final String heroi;
  final String imagem;
  final int vida;
  final int moedas;
  final int poder;
  final int inteligencia;
  final double escala;

  const TelaDeGameplay({
    super.key,
    required this.heroi,
    required this.imagem,
    required this.vida,
    required this.moedas,
    required this.poder,
    required this.inteligencia,
    required this.escala,
  });

  @override
  State<TelaDeGameplay> createState() => _TelaDeGameplayState();
}

class _TelaDeGameplayState extends State<TelaDeGameplay>
    with SingleTickerProviderStateMixin {
  // POSIÇÃO
  double posicaoHorizontal = 40;

  // PULO
  double alturaPulo = 0;
  bool pulando = false;

  // DIREÇÃO
  bool olhandoParaEsquerda = false;

  // ANIMAÇÃO DO PULO
  late AnimationController controladorPulo;
  late Animation<double> animacaoPulo;

  @override
  void initState() {
    super.initState();

    controladorPulo = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    animacaoPulo = Tween<double>(begin: 0, end: 180).animate(
      CurvedAnimation(parent: controladorPulo, curve: Curves.easeInOut),
    );

    controladorPulo.addListener(() {
      if (!mounted) return;

      setState(() {
        alturaPulo = animacaoPulo.value;
      });
    });

    controladorPulo.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Depois de chegar no ponto mais alto,
        // começa a voltar para o chão.
        controladorPulo.reverse();
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          alturaPulo = 0;
          pulando = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controladorPulo.dispose();
    super.dispose();
  }

  // ANDAR PARA DIREITA
  void andarParaDireita() {
    setState(() {
      posicaoHorizontal += 40;

      // Olha para a direita
      olhandoParaEsquerda = false;
    });
  }

  // ANDAR PARA ESQUERDA
  void andarParaEsquerda() {
    setState(() {
      if (posicaoHorizontal > 10) {
        posicaoHorizontal -= 40;
      }

      // Olha para a esquerda
      olhandoParaEsquerda = true;
    });
  }

  // PULAR
  void pular() {
    if (pulando) return;

    setState(() {
      pulando = true;
    });

    controladorPulo.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDBWm31jaWt-tuAZx5f2-ZVA80ZWC2RSeCByRH33A3vMioH2bZeAIKNjs&s=10",
              fit: BoxFit.cover,
            ),
          ),

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

          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,

            left: posicaoHorizontal,

            bottom: 120 + alturaPulo,

            child: Transform.scale(
              scale: widget.escala,
              alignment: Alignment.bottomCenter,

              child: Transform(
                // Vira a imagem horizontalmente
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scale(olhandoParaEsquerda ? -1.0 : 1.0, 1.0),

                child: SizedBox(
                  width: 150,
                  height: 180,

                  child: Image.asset(
                    widget.imagem,

                    fit: BoxFit.contain,

                    alignment: Alignment.bottomCenter,

                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 100,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 30,
            child: ElevatedButton(
              onPressed: andarParaEsquerda,
              child: const Text("⬅ Esquerda", style: TextStyle(fontSize: 18)),
            ),
          ),

          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: ElevatedButton(
              onPressed: pular,
              child: const Text("Pular ⬆", style: TextStyle(fontSize: 18)),
            ),
          ),

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
