abstract class PaymentEvent {}

class SelectPaymentMethod extends PaymentEvent {
  final String method;
  SelectPaymentMethod(this.method);
}
abstract class OrderSuccessEvent {}

class LoadOrderSuccess extends OrderSuccessEvent {}
