import 'package:ecommerce_app/features/Home/Data/model/categoryData.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:ecommerce_app/features/Home/Data/repos/homeRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final HomeRepo homeRepo;

  HomeDataModel? homeData;

  bool isMore = false;

  List<Product> discountProducts = [];


  Map<int, bool> isFavorite = {};

  Map<int, bool> isCart = {};

  HomeCubit(this.homeRepo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  void getHomeData() {
    emit(HomeLoading());

    homeRepo.getHomeData().then((value) {
      value.fold((l) =>
          emit(HomeError(l))
          , (r) async {
            homeData = r;

            for (var i in homeData!.data.products) {
              isFavorite.addAll(
                  {
                    i.id: i.inFavorites
                  }
              );

              isCart.addAll(
                  {
                    i.id: i.inCart
                  }
              );
            }

            final categoryData = await homeRepo.getCategories();

            categoryData.fold((l) => emit(HomeError(l))
                , (c) {
                  emit(HomeLoaded(c));
                });
          }
      );
    }
    );
  }

  }

