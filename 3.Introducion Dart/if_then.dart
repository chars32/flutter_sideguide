void main() {
  bool isRaining = true;

  if (isRaining) print('stay inisde'); //statement executes singleline

  //Ternary operators

  bool conditionValue = true;
  String trueValue = "I'm picked if the condition is true";
  String falseValue = "I'm picked if the condition is false";

  var ternaryResult = conditionValue ? trueValue : falseValue;
  print(ternaryResult);

  // Switch Statements
  var grade = "A";

  switch (grade) {
    case "A":
      {
        print("You did great! Congrats");
        break;
      }
    case "B":
      {
        print("Good Effort");
        break;
      }
    case "C":
      {
        print("Not great, but you passed.");
        break;
      }
    case "D":
      {
        print("Uh Oh, you should study more");
        break;
      }
    case "F":
      {
        print("You'll have to try harder next time!");
        break;
      }
    default:
      {
        print("Invalid choice");
        break;
      }
  }
}
