import '../../screens/payment/orderItemModel.dart';

class PaymentState {
  final String selectedMethod;

  PaymentState({required this.selectedMethod});

  PaymentState copyWith({String? selectedMethod}) {
    return PaymentState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
    );
  }
}
abstract class OrderSuccessState {}

class OrderSuccessInitial extends OrderSuccessState {}

class OrderSuccessLoading extends OrderSuccessState {}

class OrderSuccessLoaded extends OrderSuccessState {
  final String orderId;
  final String deliveryDate;
  final List<OrderItem> items;

  OrderSuccessLoaded({
    required this.orderId,
    required this.deliveryDate,
    required this.items,
  });
}