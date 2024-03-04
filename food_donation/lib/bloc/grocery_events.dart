class GroceryEvents {}

class ChangeTheme extends GroceryEvents {
  bool? themeStatus;
  bool fromLogout;

  ChangeTheme({this.themeStatus, this.fromLogout = false});
}
