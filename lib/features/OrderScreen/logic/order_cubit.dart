// file: cart_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../MenuMainApp/data/menu_model.dart';


// الحالة (State) تحتفظ بقائمة العناصر المضافة
class CartState {
  final List<RecipeModel> cartItems;
  CartState({required this.cartItems});
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartItems: []));

  // إضافة وجبة للسلة
  void addToCart(RecipeModel recipe) {
    final updatedList = List<RecipeModel>.from(state.cartItems)..add(recipe);
    emit(CartState(cartItems: updatedList));
  }

  // إزالة وجبة من السلة
  void removeFromCart(RecipeModel recipe) {
    final updatedList = List<RecipeModel>.from(state.cartItems)..remove(recipe);
    emit(CartState(cartItems: updatedList));
  }

  // حساب المجموع الفرعي (Sub-Total)
  double get subTotal {
    return state.cartItems.fold(0, (sum, item) => sum + item.price);
  }
}