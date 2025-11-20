import 'package:flutter/material.dart';
import '../utils/formatters.dart';
import '../models/game.dart';
import '../screens/game_detail_screen.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard({required this.game, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => GameDetailScreen(game: game)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                color: Colors.grey[300],
                child: (game.imageUrl == null)
                    ? const Icon(Icons.videogame_asset)
                    : Image.network(game.imageUrl!, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(formatCurrency(game.price)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
