class GroceryEvents {}

class ChangeTheme extends GroceryEvents {
  bool? themeStatus;
  bool fromLogout;

  ChangeTheme({this.themeStatus, this.fromLogout = false});
}

class SignupValidation extends GroceryEvents {
  String? fullName;
  String? emailId;
  String? signupPass;

  SignupValidation(
      {required this.fullName,
      required this.signupPass,
      required this.emailId});
}
