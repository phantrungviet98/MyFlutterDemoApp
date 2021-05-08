import 'dart:math';

getRandomNumber(int from, int to) {
  var rand = new Random();
  return rand.nextInt(to - from + 1) + from;
}