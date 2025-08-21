import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/payment/orderItemModel.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState(selectedMethod: '')) {
    on<SelectPaymentMethod>((event, emit) {
      emit(state.copyWith(selectedMethod: event.method));
    });
  }
}
class OrderSuccessBloc extends Bloc<OrderSuccessEvent, OrderSuccessState> {
  OrderSuccessBloc() : super(OrderSuccessInitial()) {
    on<LoadOrderSuccess>((event, emit) async {
      emit(OrderSuccessLoading());
      await Future.delayed(const Duration(seconds: 1)); // Simulate loading
      emit(OrderSuccessLoaded(
        orderId: '234379XXXXX',
        deliveryDate: '29 July 2025',
        items: [
          OrderItem(
            imageUrl: 'assets/images/kids.png',
            name: 'Barcelona',
            quantity: 2,
            price: 7600,
          ),
          OrderItem(
            imageUrl: 'assets/images/men.png',
            name: 'Game Changer',
            quantity: 1,
            price: 6000,
          ),
        ],
      ));
    });
  }
}


