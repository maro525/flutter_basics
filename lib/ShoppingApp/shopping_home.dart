import 'package:reactive_exploration/src/scoped/complete.dart' as scoped;

void main() {
  final flavor = Architecture.scoped;

  print("\n\n===== Running: $flavor =====\n\n");

  switch (flavor) {
    case Architecture.scoped:
      scoped.main();
      return;
  }
}

enum Architecture {
  bloc,
  blocComplex,
  blocStart,
  scoped,
  singleton,
  start,
  startBlob,
  vanilla,
  valueNotifier,
  redux,
}