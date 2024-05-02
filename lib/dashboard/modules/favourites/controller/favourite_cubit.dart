import 'package:bloc/bloc.dart';
import 'package:dashboard/dashboard/modules/product/controller/product_cubit.dart';
import 'package:dashboard/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:dashboard/dashboard/modules/product/model/repos/database_repo.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(FavouriteStateLoading());
    await repo.initDB();

    products = await repo.fetchFavouriteProducts();
    if (products.isEmpty) {
      emit(FavouriteStateEmpty());
    } else {
      emit(FavouriteStateLoaded());
    }
  }

  Future<void> addItemToFavorite(int id, int value) async {
    await repo.updateFavourite(value, id);
    await init();
    await ProductCubit.instance.init();
    emit(FavouriteStateLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(FavouriteStateLoaded());
  }
}