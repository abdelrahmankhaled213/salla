import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/home_details_cubit.dart';

class CachedNetworkImageDetailsScreen extends StatelessWidget {

  const CachedNetworkImageDetailsScreen({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDetailsCubit, HomeDetailsState>(
      builder: (context, state) {
        return CachedNetworkImage(
          imageUrl: state is SelectedProductImage ?
          HomeDetailsCubit.get(context).selectedImage!
              :HomeDetailsCubit.get(context).productChosen.images![0],
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      },
    );
  }
}
