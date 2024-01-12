import 'dart:io';
import 'dart:math';

String step1 = '''







|__________
''';

String step2 = '''
|      
|        
|       
|      
|       
|      
|
|__________
''';

String step3 = '''
___________
|
|
|
|
|
|
|
|__________
''';

String step4 = '''
___________
|         |
|         |
|
|
|
|
|
|__________
''';

String step5 = '''
___________
|         |
|         |
|         O
|       --|--
|         |
|        | |
|
|__________
''';

void main() {

  // String textFile = loadTxtFile("");

  String textFile = loadTxtFile("fruits.txt");

  List<String> wordsList = textFile.split("\n");

  String randomWord = getRandomWord(wordsList);
  String randomWordObscured = replaceRandomLetters(randomWord);

  int noOfGuess = 0;
  bool guessIsCorrect = false;

  printStep(noOfGuess);
  print(randomWordObscured);

  // Get the user input
  print("Enter your guess > ");
  String? usersGuess = stdin.readLineSync();

}

// Takes in a path for the text file.
// Read the file from the given path and
// return the result as a string
String loadTxtFile(String filePath){
  // TODO: add validation here to ensure that filePath isn't empty
  // if filePath is empty, it will throw an exception in the console
  // when the program is run
  File words = File(filePath);
  String textFile = words.readAsStringSync();
  return textFile;
}

bool checkAnswer(String correctAnswer, String? userAnswer) {
  // Convert user's input to lowercase for comparison
  return correctAnswer.toLowerCase() == userAnswer?.toLowerCase();
}

// Print the current hangman step
void printStep(int step) {

  // TODO: refactor this (maybe)
  if (step == 0) {
    print(step1);
  }
  if (step == 1) {
    print(step2);
  }
  if (step == 2) {
    print(step3);
  }
  if (step == 3) {
    print(step4);
  }
  if (step == 4) {
    print(step5);
  }

  // TODO: this doesn't seems correct :<
  // switch (step) {
  //   case 1:
  //     print(step1);
  //   case 2:
  //     print(step2);
  //   case 3:
  //     print(step3);
  //   case 4:
  //     print(step4);
  //   case 5:
  //     print(step5);
  // }

}

// Takes in a List and shuffle it,
// and return first item in the list
// after it was shuffled
// E.g. input: ["a", "b", "c", "d"]
// E.g. output: "c"
String getRandomWord(List<String> listOfString) {
  listOfString.shuffle();
  return listOfString[0];
}

// Replace random letters in a given string with a _
// and return the result
// E.g. input: watermelon
// E.g. output: w___r___o_
String replaceRandomLetters(String word) {
  if (word.isEmpty) {
    return word;
  }
  List<String> characters = word.split('');
  int replaceCount = Random().nextInt(characters.length + 1);
  for (int i = 0; i < replaceCount; i++) {
    int randomIndex = Random().nextInt(characters.length);
    characters[randomIndex] = '_';
  }
  return characters.join();
}