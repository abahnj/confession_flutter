import 'package:confession_flutter/utils.dart';
import 'package:flutter/cupertino.dart';

enum Vocation { single, married, priest, religious }
enum Age { adult, teen, child }
enum Gender { male, female }

class User with ChangeNotifier {
  Vocation _vocation;
  Age _age;
  Gender _gender;

  User({vocation, age, gender})
      : _vocation = vocation,
        _age = age,
        _gender = gender;

  User.initial()
      : _vocation = Vocation.single,
        _age = Age.adult,
        _gender = Gender.male;

  User copyWith({Vocation vocation, Age age, Gender gender}) {
    return User(
        vocation: vocation ?? _vocation,
        age: age ?? _age,
        gender: gender ?? _gender);
  }

  Vocation get vocation => _vocation;

  set vocation(Vocation value) {
    _vocation = value;
    notifyListeners();
  }

  Age get age => _age;

  set age(Age value) {
    _age = value;
    notifyListeners();
  }

  Gender get gender => _gender;

  set gender(Gender value) {
    _gender = value;
    notifyListeners();
  }

  List<int> returnCommandmentsForUser() {
    if (age == Age.child) {
      return [11, 14];
    } else if (vocation == Vocation.priest || vocation == Vocation.religious) {
      return [11, 12, 13, 14, 15];
    } else {
      return [for (var i = 1; i <= 10; i += 1) i];
    }
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
