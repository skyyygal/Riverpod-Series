import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/main.dart';

class ChangeTheme extends ConsumerStatefulWidget {
  const ChangeTheme({super.key});

  @override
  ConsumerState<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends ConsumerState<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeProvider);
    return Scaffold(
      body: Column(
        children: [
          Text(
            isDark ? 'Dark Mode' : 'Light Mode',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Icon(isDark ? Icons.nightlight_round : Icons.wb_sunny_outlined),
          const SizedBox(height: 30),
          Switch(
            value: isDark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).state = value;
            },
          ),
          Checkbox(
            value: isDark,
            onChanged: (value) {
              // ref.read(themeProvider.notifier).state == value;
              ref.read(themeProvider.notifier);
            },
          ),
        ],
      ),
    );
  }
}
