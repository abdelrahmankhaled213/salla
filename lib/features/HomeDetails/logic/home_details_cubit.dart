import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_details_state.dart';

class HomeDetailsCubit extends Cubit<HomeDetailsState> {

  HomeDetailsCubit() : super(HomeDetailsInitial());

  static HomeDetailsCubit get(context) => BlocProvider.of(context);

  late Product productChosen;

   String? selectedImage;



  void selectedProduct(Product product) {
    productChosen = product;
  }

  void selectedProductImage(String image) {
    selectedImage = image;
    emit(SelectedProductImage());
  }

}
