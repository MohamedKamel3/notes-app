import 'dart:math';

int getRandomNoteColor() {
  final random = Random();
  final colors = [
    0xffa1a1a1, // Light gray
    0xffffcb7a, // Light orange
    0xff90ee90, // Light green
    0xffffb6c1, // Light pink
    0xffadd8e6, // Light blue
    0xffffd700, // Gold
    0xff98fb98, // Pale green
    0xffffa07a, // Light salmon
    0xffe6e6fa, // Lavender
    0xffdda0dd, // Plum
  ];
  return colors[random.nextInt(colors.length)];
}
