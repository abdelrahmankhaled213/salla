import 'package:ecommerce_app/features/Cart/Data/model/addOrDeleteCart.dart';
import 'package:ecommerce_app/features/Cart/Data/repos/cartRepo.dart';
import 'package:ecommerce_app/features/Cart/Domain/entity/cartEntity.dart';
import 'package:ecommerce_app/features/Home/logic/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {

final CartRepo cartRepo;

final HomeCubit homeCubit;

 CartCubit(this.cartRepo,{required this.homeCubit}) : super(CartInitial());

   static CartCubit get(context) => BlocProvider.of(context);

   getCart() async{


      emit(GetCartLoading());



      final cart=await cartRepo.getCart();

      if(isClosed) {
        return;
      }

      cart.fold(

          (l) => emit(GetCartError(l)), (r) {

             emit(GetCartSuccess(r));

          }
      );

   }

   addOrRemoveCart(int cartEntityId) async{

     homeCubit.isCart[cartEntityId] = ! homeCubit.isCart[cartEntityId]!;

emit(ChangeCartState());

     final result = await cartRepo.addOrRemoveCart(cartEntityId);

     if(isClosed) {
       return;
     }

result.fold(
    (String l){

      homeCubit.isCart[cartEntityId] = ! homeCubit.isCart[cartEntityId]!;
      emit(AddOrDeleteCartError(l));

    },
    (r){

if(!r.status){
  homeCubit.isCart[cartEntityId]=!homeCubit.isCart[cartEntityId]!;
}
else{
  getCart();
}
      emit(AddOrDeleteCartSuccess(r));

    }
);

   }

}
