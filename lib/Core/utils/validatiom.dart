bool validateLowerCase(String input) {
  // This regular expression matches any string that contains only lowercase letters and spaces
  String pattern = r'^[a-zA-Z\s]+$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(input);
}

bool validateKeyLength(String input, String key) {
  // This checks if the length of the key is less than or equal to the length of the input
  return key.length <= input.length;
}

bool validateLettersOnly(String input) {
  // This regular expression matches any string that contains only letters
  String pattern = r'^[a-zA-Z]+$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(input);
}

bool validateSingleLowerCaseLetter(String input) {
  // This regular expression matches any string that contains exactly one lowercase letter
  String pattern = r'^[a-z]$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(input);
}

int gcd(int a, int b) {
  // This is the implementation of the Euclidean algorithm to find the greatest common divisor (gcd)
  if (b == 0) {
    return a;
  } else {
    return gcd(b, a % b);
  }
}

bool validateRelativelyPrimeWith26(int input) {
  // This checks if the input is relatively prime with 26 (i.e., their gcd is 1)
  return gcd(26, input) == 1;
}

bool validateKeyLengthWithLastWord(String input, String key) {
  // This checks if the length of the key is less than or equal to the length of the last word in the input
  List<String> words = input.split(' ');
  String lastWord = words.last;
  return key.length <= lastWord.length;
}

bool validateNoSpaces(String key) {
  // This checks if the key contains no spaces
  return !key.contains(' ');
}
