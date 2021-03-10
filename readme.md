Small sample project created to reproduce [this issue](https://github.com/Dart-Code/Dart-Code/issues/3194)

Need to `flutter run --no-sound-null-safety` in order to run.

I created 5 breakpoints of which only the first worked:
1. [line 38 in `main.dart` works](https://github.com/skateboarder/_brokenBreakpoints/blob/04e162525b216d46dd03902ee8e62ba89718ec05/lib/main.dart#L38)
2. [lines 30,38,67 and 76 in `trying.dart` don't work](https://github.com/skateboarder/_brokenBreakpoints/blob/master/lib/trying.dart)

My method of testing was to put a breakpoint on the aforementioned lines, and then check if I saw a pause before `print`'s text showed up in the Debug Console.
