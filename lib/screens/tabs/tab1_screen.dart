import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  final ingredients = ['Eggs', 'Chicken', 'Tomatoes', 'Garlic', 'Rice'];
  final selected = {'Eggs', 'Chicken'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PantryCraft • Ingredients', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.secondary),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('WHAT DO YOU HAVE IN YOUR FRIDGE?', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.textSecondary)),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    children: ingredients.map((ing) {
                      final isSel = selected.contains(ing);
                      return FilterChip(
                        label: Text(ing),
                        selected: isSel,
                        selectedColor: AppTheme.primary.withValues(alpha: 0.4),
                        onSelected: (val) {
                          setState(() {
                            if (val) {
                              selected.add(ing);
                            } else {
                              selected.remove(ing);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => RoutingService.openRegistrationUrl(),
              icon: const Icon(Icons.restaurant),
              label: const Text('Find Recipes I Can Cook Now (12 Dishes)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
