import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:ecommerce_app/features/Search/Data/repos/searchRepo.dart';
import 'package:ecommerce_app/features/Search/logic/Debouncer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  final DeBouncer bouncer;

  SearchCubit(this.searchRepo, this.bouncer) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  search(String text) async{

    if(text.isEmpty){
  emit(SearchInitial());
  return;
  }

     emit(SearchLoading());

     if(isClosed) {
       return;
     }

bouncer.run(() async{

  final result = await searchRepo.search(text);

  result.fold((l) => emit(SearchFailure(msg: l))

      , (r) => emit(SearchLoaded(products: r)));

},);


  }
@override
  Future<void> close() {
    // TODO: implement close
  bouncer.dispose();
    return super.close();
  }
}




