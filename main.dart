import 'dart:io';
import 'dart:math';

String failedAttempt1 = '''







|__________
''';

String failedAttempt2 = '''
|      
|        
|       
|      
|       
|      
|
|__________
''';

String failedAttempt3 = '''
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

String failedAttempt4 = '''
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

String failedAttempt5 = '''
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

String successAttempt = '''
___________
|         
|         
|         
|
|         O
|       >-|-<
|         |
|________|_|_ 
''';

void main() {

  // Simulate an empty filePath
  // String textFile = loadTxtFile("");

  String textFile = loadTxtFile("fruits.txt");

  List<String> wordsList = textFile.split("\n");

  int noOfFailedAttempt = 0;

  String randomWord = getRandomWord(wordsList);
  String randomWordObscured = replaceRandomLetters(randomWord);

  while(noOfFailedAttempt != 5){
    
    print(randomWordObscured);

    // Get the user input
    print("Enter your guess (type in full word) > ");
    String? usersGuess = stdin.readLineSync();

    if(checkAnswer(randomWord, usersGuess)){
      print("Correct !");
      print(successAttempt);
      break;
    }
    else{
      noOfFailedAttempt++;
      printFailedAttempt(noOfFailedAttempt); // should not print anything as it is 0

      if(noOfFailedAttempt == 5){
        print("GAME OVER !");
      }

    }

  }

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

// Compare two given parameters (correctAnswer and userAnswer)
// returns true if both parameters match
// returns false if both parameters match
bool checkAnswer(String correctAnswer, String? userAnswer) {
  // Convert user's input to lowercase for comparison
  return correctAnswer.toLowerCase() == userAnswer?.toLowerCase();
}

// Print the current hangman step
void printFailedAttempt(int attempt) {
  // TODO: refactor this (maybe)
  if (attempt == 1) {
    print(failedAttempt1);
  }
  if (attempt == 2) {
    print(failedAttempt2);
  }
  if (attempt == 3) {
    print(failedAttempt3);
  }
  if (attempt == 4) {
    print(failedAttempt4);
  }
  if (attempt == 5) {
    print(failedAttempt5);
  }
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