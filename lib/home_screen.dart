import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TO READ CONST VALUE
final hello = Provider<String>((ref) {
  return 'Subscriber';
});

final age = Provider<int>((ref) {
  return 24;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final subscribe = ref.watch(hello);
    final displayAge = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$subscribe, age: ${displayAge.toString()}")),
    );
  }
}

/* 
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscribe = ref.watch(hello);
    final displayAge = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$subscribe, age: ${displayAge.toString()}")),
    );
  }
}
 */
