import 'package:dashboard/dashboard/modules/favourites/controller/favourite_cubit.dart';
import 'package:dashboard/dashboard/modules/favourites/view/components/favourite_item_widget.dart';
import 'package:dashboard/dashboard/modules/product/controller/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit(),
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          final FavouriteCubit controller = context.read<FavouriteCubit>();
          return Scaffold(
            body: state is ProductStateLoading
                ? const CircularProgressIndicator()
                : state is ProductStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => FavouriteItemWidget(
                          productModel: controller.products[index],
                          controller: controller,
                        ),
                        itemCount: controller.products.length,
                      ),
          );
        },
      ),
    );
  }
}