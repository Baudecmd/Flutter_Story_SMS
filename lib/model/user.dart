class User{

  String firstName,lastName;

  User({required this.firstName,required this.lastName});

  @override
  String toString() {
    // TODO: implement toString
    return firstName+" "+lastName;
  }
}