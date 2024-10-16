import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String? winner;

  void _handleTap(int index) {
    if (board[index] == '' && winner == null) {
      setState(() {
        board[index] = currentPlayer;
        winner = _checkWinner();
        if (winner == null && currentPlayer == 'X') {
          currentPlayer = 'O';
          _aiMove(); // IA faz a jogada após o turno do jogador
        }
      });
    }
  }

  void _aiMove() {
    int bestScore = -1000;
    int bestMove = -1;

    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') {
        board[i] = 'O';
        int score = minimax(board, 0, false);
        board[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (bestMove != -1) {
      setState(() {
        board[bestMove] = 'O';
        winner = _checkWinner();
        if (winner == null) {
          currentPlayer = 'X'; // Volta para o jogador humano
        }
      });
    }
  }

  int minimax(List<String> board, int depth, bool isMaximizing) {
    String? result = _checkWinner();
    if (result != null) {
      if (result == 'O') return 10 - depth;
      if (result == 'X') return depth - 10;
      if (result == 'Draw') return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          int score = minimax(board, depth + 1, false);
          board[i] = '';
          bestScore = score > bestScore ? score : bestScore;
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          int score = minimax(board, depth + 1, true);
          board[i] = '';
          bestScore = score < bestScore ? score : bestScore;
        }
      }
      return bestScore;
    }
  }

  String? _checkWinner() {
    List<List<int>> winningCombos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombos) {
      String a = board[combo[0]];
      String b = board[combo[1]];
      String c = board[combo[2]];
      if (a != '' && a == b && a == c) {
        return a; // Retorna o vencedor (X ou O)
      }
    }

    if (!board.contains('')) {
      return 'Draw'; // Retorna empate se o tabuleiro estiver cheio
    }

    return null;
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = null;
    });
  }

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
                  onTap: () => _handleTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black, width: 2), 
                      color:
                          Colors.blue.shade50, 
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: const TextStyle(
                            fontSize: 50), 
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
            onPressed: _resetGame,
            child: const Text('Reiniciar Jogo'),
          ),
        ],
      ),
    );
  }
}
