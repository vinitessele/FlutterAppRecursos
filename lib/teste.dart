import 'package:flutter/material.dart';

class TicTacToeteste extends StatefulWidget {
  @override
  _TicTacToetesteState createState() => _TicTacToetesteState();
}

class _TicTacToetesteState extends State<TicTacToeteste> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String? winner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha - IA Minimax'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: null,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      color: Colors.blue.shade50,
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            winner == null
                ? 'Turno do jogador: $currentPlayer'
                : winner == 'Draw'
                    ? 'Empate!'
                    : 'Vencedor: $winner!',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: null,
            child: const Text('Reiniciar Jogo'),
          ),
        ],
      ),
    );
  }

  // Funções de lógica do jogo
}
