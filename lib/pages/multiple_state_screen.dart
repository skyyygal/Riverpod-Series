import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/provider/multiple_state_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("object");
    return Scaffold(
      appBar: AppBar(title: Text("Slider App")),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                sliderProvider2.select((state) => state.showPassword),
              );
              // print("container");
              return InkWell(
                onTap: () {
                  print("Show Passweord");
                  final stateProvider2 = ref.read(sliderProvider2.notifier);
                  stateProvider2.state = stateProvider2.state.copyWith(
                    showPassword: !slider,
                  );
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  // color: Colors.red.withOpacity(slider.slider),
                  child: slider
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.image),
                ),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                sliderProvider2.select((state) => state.slider),
              );
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
              final slider = ref.watch(
                sliderProvider2.select((state) => state.slider),
              );
              print("slider");
              return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider2 = ref.read(sliderProvider2.notifier);
                  stateProvider2.state = stateProvider2.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
