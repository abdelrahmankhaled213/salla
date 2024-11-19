import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/widgets/my_textform.dart';
import 'package:ecommerce_app/features/Favourites/Ui/screens/FavouritesScreenView.dart';
import 'package:ecommerce_app/features/Home/Ui/screens/homeScreenView.dart';
import 'package:ecommerce_app/features/Search/logic/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {

  late TextEditingController searchController ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    searchController=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
return  Scaffold(
  body: SafeArea(
      child:Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 12.w
        ),
        child: Column(
            children: [

       MyTextFormField(labelText: AppText.search,
          controller:searchController ,onChange: (p0) {
            SearchCubit.get(context).search(p0!);
          },),
        verticalSpace(8),
        BlocBuilder<SearchCubit, SearchState>(

          builder: (context, state) {

            final searchCubit = SearchCubit.get(context);

            if(state is SearchLoading){
              return loadingWidget();
            }

            else if(state is SearchLoaded){
              return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => verticalSpace(8),

                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(state.products[index].name);
                    },
                    itemCount:  state.products.length,

                  )
              );
            }
            else if(state is SearchFailure){
              return DataError(errorMsg: state.msg);
            }
            else{
              return const SizedBox();
            }
          },

        )

            ]
        ),
      ),
  ),

  );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
}