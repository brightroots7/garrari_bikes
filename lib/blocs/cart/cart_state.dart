import '../../screens/cart/cart_model.dart';

class CartState {
  final List<CartItem> items;
  final List<Map<String, String>> addresses;
  final int selectedAddressIndex;

  CartState({
    required this.items,
    required this.addresses,
    required this.selectedAddressIndex,
  });

  CartState copyWith({
    List<CartItem>? items,
    List<Map<String, String>>? addresses,
    int? selectedAddressIndex,
  }) {
    return CartState(
      items: items ?? this.items,
      addresses: addresses ?? this.addresses,
      selectedAddressIndex: selectedAddressIndex ?? this.selectedAddressIndex,
    );
  }

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}
