class GroceryStates {
  List? shopItems;

  final List? cartItems;

  bool themeStatus;
  String? greetingStatus;
  int? totalAmount;
  bool signupStatus = true;

  GroceryStates(
      {required this.cartItems,
      this.totalAmount,
      this.greetingStatus,
      this.themeStatus = true,
      this.shopItems,
      this.signupStatus = false});
}
