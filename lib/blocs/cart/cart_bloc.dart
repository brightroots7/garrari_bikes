import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/cart/cart_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(
    CartState(
      items: [],
      addresses: [
        {
          'name': 'John Doe',
          'address': '123 Main Street, Springfield, IL',
        },
        {
          'name': 'Jane Smith',
          'address': 'House 1920, Sector-15, Panchkula, Haryana, Pin-1601662',
        },
      ],
      selectedAddressIndex: 0,
    ),
  ) {
    on<AddItem>((event, emit) {
      final items = List<CartItem>.from(state.items)..add(event.item);
      emit(state.copyWith(items: items));
    });

    on<RemoveItem>((event, emit) {
      final items = List<CartItem>.from(state.items)..remove(event.item);
      emit(state.copyWith(items: items));
    });

    on<IncrementItem>((event, emit) {
      event.item.quantity++;
      emit(state.copyWith(items: List<CartItem>.from(state.items)));
    });

    on<DecrementItem>((event, emit) {
      if (event.item.quantity > 1) {
        event.item.quantity--;
        emit(state.copyWith(items: List<CartItem>.from(state.items)));
      }
    });

    // Address handling
    on<SelectAddress>((event, emit) {
      emit(state.copyWith(selectedAddressIndex: event.selectedIndex));
    });

    on<AddAddress>((event, emit) {
      final updatedAddresses = List<Map<String, String>>.from(state.addresses)
        ..add(event.newAddress);
      emit(state.copyWith(addresses: updatedAddresses));
    });
  }
}
