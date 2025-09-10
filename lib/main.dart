import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/flutter%20basic/checklist/darkTheme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final themeProvider = StateProvider<bool>((ref) => false);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDark = ref.watch(themeProvider);
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: isDark ? ThemeData.dark() : ThemeData.light(),
        //  ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // ),
        home: ChangeTheme(),
      ),
    );
  }
}
