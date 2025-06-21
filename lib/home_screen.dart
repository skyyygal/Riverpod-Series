import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TO READ CONST VALUE
final hello = Provider<String>((ref) {
  return 'Subscriber';
});

final counter = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build 1");
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(counter);
              print("build 2");
              return Center(child: Text(count.toString()));
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
                child: Text("+", style: TextStyle(fontSize: 30)),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (ref.read(counter) > 0) {
                    ref.read(counter.notifier).state--;
                  }
                },
                child: Text("-", style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
