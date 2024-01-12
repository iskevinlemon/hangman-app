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
|        |
|        |
|
|
|
|
|
|__________
''';

String step5 = '''
___________
|        |
|        |
|        O
|      --|--
|        |
|       | |
|
|__________
''';

void main(){

  File words = File("fruits.txt");
  String textFile = words.readAsStringSync();

  List<String> wordsList = textFile.split("\n");

  String randomWord = getRandomWord(wordsList);
  String randomWordObscured = replaceRandomLetters(randomWord);

  int noOfGuess = -1;
  bool guessIsCorrect = false;

  while (noOfGuess != 5) {
    if (guessIsCorrect != true) {
      // 1noOfGuess++;

      printStep(noOfGuess);      

      print(randomWordObscured);
      print("Enter your guess > ");
      String? guess = stdin.readLineSync();

      if(noOfGuess == 5){
        if(guessIsCorrect){
          print("You win !");
        }
        else{
          print("GAME OVER !");
        }
      }

      if(checkAnswer(randomWord, guess)) {
        noOfGuess = 4;
        guessIsCorrect = true;
      } 
      else {
        print("Incorrect answer");
        guessIsCorrect = false;
        noOfGuess++;
      }
    } 
    
    // else {
    //   print("Correct answer");
    // }
  }
  
}

bool checkAnswer(String correctAnswer, String? userAnswer){
  if(correctAnswer == userAnswer){
    return true;
  }
  else{
    return false;
  }
}

void printStep(int step) {
  if (step == 1) {
    print(step1);
  }
  if (step == 2) {
    print(step2);
  }
  if (step == 3) {
    print(step3);
  }
  if (step == 4) {
    print(step4);
  }
  if (step == 5) {
    print(step5);
  }
}

String getRandomWord(List<String> listOfString){
  listOfString.shuffle();
  return listOfString[0];
}

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