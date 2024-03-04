
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grocery_events.dart';
import 'grocery_states.dart';

class GroceryBloc extends Bloc<GroceryEvents, GroceryStates> {
  GroceryBloc() : super(GroceryStates(cartItems: [])) {}
}
