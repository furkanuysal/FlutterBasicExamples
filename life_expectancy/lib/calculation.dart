import 'package:life_expectancy/user_data.dart';

class Calculator {
  UserData userData;
  Calculator(this.userData);

  double calculate() {
    double result;
    if (userData.chosenSex == 'FEMALE') {
      result = 85 + userData.dayNumber! - userData.smokedCigarette!;
      if ((userData.height! / userData.weight!) < 3) {
        result = result - 5;
        return result;
      }
      return result;
    } else {
      result = 80 + userData.dayNumber! - userData.smokedCigarette!;
      if ((userData.height! / userData.weight!) < 3) {
        result = result - 5;
        return result;
      }
      return result;
    }
  }
}
