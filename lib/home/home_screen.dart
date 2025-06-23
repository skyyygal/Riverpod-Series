import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/home/provider/slider_provider.dart';

class HomeScreen2 extends ConsumerWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("object");
    return Scaffold(
      appBar: AppBar(title: Text("Slider App")),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider);
              print("container");
              return Container(
                height: 100,
                width: 100,
                color: Colors.red.withOpacity(slider),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider);
              print("slider");
              return Slider(
                value: slider,
                onChanged: (value) {
                  ref.read(sliderProvider.notifier).state = value;
                },
              );
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen2()),
              );
            },
            child: Text("Next Screen"),
          ),
        ],
      ),
    );
  }
}

final counter = StateProvider<int>((ref) {
  return 0;
});
final switchProvider = StateProvider<bool>((ref) {
  return true;
});

// /*
class HomeScreen3 extends ConsumerWidget {
  const HomeScreen3({super.key});

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
          Consumer(
            builder: (context, ref, child) {
              final didSwitch = ref.watch(switchProvider);
              print("build 3");
              return Switch(
                value: didSwitch,
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                },
              );
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (ref.read(counter) > 0) {
                    ref.read(counter.notifier).state--;
                  }
                },
                child: Text("-", style: TextStyle(fontSize: 30)),
              ),
              SizedBox(width: 10),

              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
                child: Text("+", style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// */
