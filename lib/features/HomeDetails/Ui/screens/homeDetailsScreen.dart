import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:ecommerce_app/features/HomeDetails/Ui/widgets/cachedNetwokImageHomeDetaills.dart';
import 'package:ecommerce_app/features/HomeDetails/logic/home_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/homeDetailsContent.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectProduct();
  }
  selectProduct(){
    HomeDetailsCubit.get(context).productChosen=widget.product;
    HomeDetailsCubit.get(context).selectedImage=widget.product.images![0];
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: SafeArea(
          child: CustomScrollView(
            slivers: [

              const SliverAppBar(
              expandedHeight: 300,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImageDetailsScreen()
              ),
              ),

            SliverToBoxAdapter(
             child: SizedBox(
               height: 15.h,
             ),
           ),

           SliverToBoxAdapter(
             child: verticalSpace(10),
           ),

           const SliverToBoxAdapter(
             child:  HomeDetailsContent(),
           ),
            ],
          ),
        ),
      );
  }
}


