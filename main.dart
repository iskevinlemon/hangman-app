import 'dart:io';
import 'dart:math';

String failedAttempt1 = '''







___________
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

  int noOfFailedAttempt = 0;
  String randomWord = "";
  String randomWordObscured = "";

  // Used for dev
  bool canStart = true;

  // Simulate an empty filePath
  // String textFile = loadTxtFile("");

  // String textFile = loadTxtFile("fruits.txt");
  String textFile = loadTxtFile("fruits_wiki.txt");

  List<String> wordsList = textFile.split("\n");

  // randomWord = getRandomWord(wordsList);

  // Convert randomWord to lowercase
  randomWord = lower(getRandomWord(wordsList));
  randomWordObscured = replaceRandomLetters(randomWord);

  // On every run of the program, validate that textFile isn't empty
  while(noOfFailedAttempt != 5 && textFile != "" && canStart){
    
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
      
			// On first run, it should not print anything as it is 0
			// Run on subsequent wrong guesses
      printFailedAttempt(noOfFailedAttempt); 

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

  File words;
  String textFile;
  String result = "";

  try{
    words = File(filePath);
    textFile = words.readAsStringSync();
    result = textFile;
  }
  catch(e){
    print(e); // Print actual error

    // Print if .txt couldn't be loaded
    if(result == ""){
      print("Error:  failed to load .txt file ");
    }
  }

  return result;
}

// Shorthand function for .toLowerCase()
String lower(String word){
  return word.toLowerCase();
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