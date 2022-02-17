String formatNumber(String number) {
  int length = number.length;
  int spaces = number.length ~/ 3;
  if (number.length % 3 == 0) spaces = spaces - 1;
  print(spaces);
  for (var i = 1; i <= spaces; i++) {
    var spacePosition = length - (i * 3);
    number = number.substring(0, spacePosition) +
        ' ' +
        number.substring(spacePosition, number.length);
  }
  return number;
}
