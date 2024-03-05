import 'package:flutter_bloc/flutter_bloc.dart';

import 'grocery_events.dart';
import 'grocery_states.dart';

class GroceryBloc extends Bloc<GroceryEvents, GroceryStates> {
  GroceryBloc() : super(GroceryStates(cartItems: [])) {
    on<SignupValidation>((event, emit) {
      String name = event.fullName!;
      String emailId = event.emailId!;
      String signupPass = event.signupPass!;
    });
  }
}
