import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider2 = StateProvider<AppState>((ref) {
  return AppState(slider: .5, showPassword: false);
});

//Creating State

//AppState represents multiple state.

class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  //Creating the copyWith Method to change the final characters
  // which means it returns a new state if the value is null, it return the previous value(this.slider) else a new value(slider).

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
