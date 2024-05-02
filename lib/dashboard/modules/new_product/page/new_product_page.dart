import 'dart:io';
import 'package:dashboard/dashboard/modules/new_product/cubit/new_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProductCubit(),
      child: BlocBuilder<NewProductCubit, NewProductState>(
        builder: (context, state) {
          final NewProductCubit cubit = context.read<NewProductCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Add new product'),
            ),
            body: Column(
              children: [
                //product name
                const Text('Name'),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: cubit.nameController,
                ),

                const Text('Description'),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: cubit.descController,
                ),

                const Text('Available count'),

                //product description
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: cubit.qntController,
                ),

                Row(
                  children: [
                    IconButton(onPressed: cubit.pickProductImage, icon: const Icon(CupertinoIcons.photo)),
                    IconButton(onPressed: cubit.takeProductImage, icon: const Icon(CupertinoIcons.camera)),
                  ],
                ),

                if (cubit.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(
                      File(cubit.image!.path),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                const Spacer(),
                TextButton(onPressed: () => cubit.addProduct(context), child: Text("add product"))
              ],
            ),
          );
        },
      ),
    );
  }
}