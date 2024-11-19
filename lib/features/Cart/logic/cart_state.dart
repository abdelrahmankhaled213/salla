part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {
  final List<CartEntity> cart;
  GetCartSuccess(this.cart);
}
final class GetCartError extends CartState {
  final String error;
  GetCartError(this.error);
}
final class ChangeCartState extends CartState {

}

final class AddOrDeleteCartSuccess extends CartState {
  final AddOrDeleteCartResponse cartResponse;
  AddOrDeleteCartSuccess(this.cartResponse);
}

final class AddOrDeleteCartError extends CartState {
  final String error;
  AddOrDeleteCartError(this.error);
}