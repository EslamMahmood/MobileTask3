import 'package:dashboard/dashboard/cubit/dashboard_cubit.dart';
import 'package:dashboard/dashboard/modules/cart/cart_page.dart';
import 'package:dashboard/dashboard/modules/favourites/view/page/favourite_page.dart';
import 'package:dashboard/dashboard/modules/product/view/page/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  final List<String> titles =const ['Product','Favourite','Cart'];
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
         DashboardCubit cubit = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(titles[cubit.currentIndex],style: const TextStyle(color: Colors.white),),
              backgroundColor: Colors.grey[700],
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'new_product');
                    },
                    icon: const Icon(CupertinoIcons.plus))
              ],
            ),
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: cubit.onChangeTab,
              children:const [
                ProductPage(),
                FavouritePage(),
                CartPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(fontSize: 15,color: Colors.black),
              currentIndex: cubit.currentIndex,
              onTap: cubit.onChangeTab,
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections), label: 'product'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'favourite'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'cart')
              ],
            ),
          );
        },
      ),
    );
  }
}