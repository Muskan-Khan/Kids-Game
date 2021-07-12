import 'dart:math';

void main() {
  var now = new DateTime.now();
  int max = 11;
  int min = 1;
  var rand = Random();
  var rand1 = Random(now.millisecondsSinceEpoch);
  for (int i = 1; i < 10; i++) {
    int r = min + rand.nextInt(max - min);
    //print("${nextInter(min, max)}");
  }
}
