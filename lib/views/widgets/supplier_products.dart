import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/core/utils/styles/text_style.dart';
import 'package:auth_task/manager/get_data_cubit/get_data_cubit.dart';
import 'package:auth_task/manager/get_data_cubit/get_data_state.dart';
import 'package:auth_task/models/place_model.dart';
import 'package:auth_task/views/widgets/item_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierProducts extends StatelessWidget {
  const SupplierProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteTextColor,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Supplier Products',
          style: AppTextStyles.textStyle16,
        ),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => GetDataCubit()..fetchPlaces(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<GetDataCubit, GetDataState>(
            builder: (context, state) {
              if (state is GetDataLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetDataError) {
                return Center(child: Text(state.message));
              } else if (state is GetDataLoaded) {
                final List<PlaceModel> places = state.places;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];

                    if (place.products.isEmpty) {
                      return const Center(
                        child: Text('No products available.'),
                      );
                    }

                    final product = place.products[0];
                    return ItemProduct(
                      image: product.image,
                      nameProduct: product.nameProduct,
                      namePlace: place.namePlace,
                      typePlace: product.typePlace,
                      price: product.price,
                      oldPrice: product.oldPrice,
                    );
                  },
                );
              }
              return const Center(child: Text('No places found.'));
            },
          ),
        ),
      ),
    );
  }
}
