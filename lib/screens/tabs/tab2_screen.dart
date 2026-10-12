import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = [
      {'title': 'Creamy Garlic Chicken Skillet', 'time': '25 min', 'cal': '480 kcal'},
      {'title': 'Classic Shakshuka With Feta', 'time': '20 min', 'cal': '320 kcal'},
      {'title': 'Crispy Teriyaki Chicken Bowl', 'time': '30 min', 'cal': '550 kcal'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matching Recipes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        itemBuilder: (context, i) {
          final r = recipes[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 4),
                    Text('${r['time']} • ${r['cal']}', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              ],
            ),
          );
        },
      ),
    );
  }
}
