import 'package:confession_flutter/utils.dart';

enum Vocation { single, married, priest, religious }
enum Age { adult, teen, child }
enum Gender { male, female }

class User {
  final Vocation vocation;
  final Age age;
  final Gender gender;

  const User(
      {this.vocation = Vocation.single,
      this.age = Age.adult,
      this.gender = Gender.male});

  User.initial()
      : vocation = Vocation.single,
        age = Age.adult,
        gender = Gender.male;

  User copyWith({Vocation vocation, Age age, Gender gender}) {
    return User(
        vocation: vocation ?? this.vocation,
        age: age ?? this.age,
        gender: gender ?? this.gender);
  }

  @override
  String toString() {
    //Strip away class name and capitalize first letter
    var gender = Utils.getEnumTitle(this.gender.toString());

    var age = Utils.getEnumTitle(this.age.toString());

    var vocation = Utils.getEnumTitle(this.vocation.toString());

    return ('$gender, $age, $vocation');
  }
}
