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
    var gender = (this.gender.toString().split('.').last)[0].toUpperCase() +
        this.gender.toString().split('.').last.substring(1);

    var age = (this.age.toString().split('.').last)[0].toUpperCase() +
        this.age.toString().split('.').last.substring(1);

    var vocation = (this.vocation.toString().split('.').last)[0].toUpperCase() +
        this.vocation.toString().split('.').last.substring(1);

    return ('$gender, $age, $vocation');
  }
}
