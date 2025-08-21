import '../../screens/cart/cart_model.dart';

abstract class CartEvent {}

class AddItem extends CartEvent {
  final CartItem item;
  AddItem(this.item);
}

class RemoveItem extends CartEvent {
  final CartItem item;
  RemoveItem(this.item);
}

class IncrementItem extends CartEvent {
  final CartItem item;
  IncrementItem(this.item);
}

class DecrementItem extends CartEvent {
  final CartItem item;
  DecrementItem(this.item);
}
class SelectAddress extends CartEvent {
  final int selectedIndex;
  SelectAddress(this.selectedIndex);
}

class AddAddress extends CartEvent {
  final Map<String, String> newAddress;
  AddAddress(this.newAddress);
}