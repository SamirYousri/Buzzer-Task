// import 'package:auth_task/manager/get_data_cubit/get_data_cubit.dart';
// import 'package:auth_task/manager/get_data_cubit/get_data_state.dart';
// import 'package:auth_task/views/widgets/custom_search_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:auth_task/core/utils/styles/app_colors.dart';
// import 'package:auth_task/views/widgets/item_cafe.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeViewBody extends StatelessWidget {
//   const HomeViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetDataCubit()..fetchPlaces(),
//       child: Column(
//         spacing: 10,
//         children: [
//           appBar(context),
//           Expanded(
//             child: BlocBuilder<GetDataCubit, GetDataState>(
//               builder: (context, state) {
//                 if (state is GetDataLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is GetDataError) {
//                   return Center(child: Text(state.message));
//                 } else if (state is GetDataLoaded) {
//                   final places = state.places;
//                   return ListView.builder(
//                     padding: EdgeInsets.all(0),
//                     itemCount: places.length,
//                     itemBuilder: (context, index) {
//                       final place = places[index];
//                       return Padding(
//                         padding:
//                             const EdgeInsets.only(left: 12, right: 12, top: 20),
//                         child: ItemCafe(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/supplierProducts');
//                           },
//                           image: place['image'] ?? '',
//                           title: place['title'] ?? 'Unknown',
//                           subTitle: place['subTitle'] ?? 'Unknown',
//                           adress: place['address'] ?? 'Unknown',
//                         ),
//                       );
//                     },
//                   );
//                 }
//                 return const Center(child: Text('No places found.'));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container appBar(BuildContext context) {
//     return Container(
//       height: MediaQuery.sizeOf(context).height * 0.2,
//       width: MediaQuery.sizeOf(context).width,
//       decoration: BoxDecoration(
//         color: AppColors.primaryColor,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 20, left: 20, top: 35),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           spacing: 25,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               spacing: 20,
//               children: [
//                 Icon(
//                   Icons.list,
//                   color: AppColors.whiteTextColor,
//                   size: 25,
//                 ),
//                 Text(
//                   'Buzzer App',
//                   style: TextStyle(
//                     color: AppColors.whiteTextColor,
//                     fontSize: 25,
//                   ),
//                 ),
//               ],
//             ),
//             CustomSearchTextField()
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:auth_task/manager/get_data_cubit/get_data_cubit.dart';
import 'package:auth_task/manager/get_data_cubit/get_data_state.dart';
import 'package:auth_task/models/place_model.dart';
import 'package:auth_task/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:auth_task/core/utils/styles/app_colors.dart';
import 'package:auth_task/views/widgets/item_cafe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDataCubit()..fetchPlaces(),
      child: Column(
        spacing: 10,
        children: [
          appBar(context),
          Expanded(
            child: BlocBuilder<GetDataCubit, GetDataState>(
              builder: (context, state) {
                if (state is GetDataLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetDataError) {
                  return Center(child: Text(state.message));
                } else if (state is GetDataLoaded) {
                  final List<PlaceModel> places = state.places;
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      final place = places[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 20),
                        child: ItemCafe(
                          onTap: () {
                            Navigator.pushNamed(context, '/supplierProducts');
                          },
                          image: place.image ?? '',
                          title: place.namePlace ?? 'Unknown',
                          subTitle: place.type ?? 'Unknown',
                          adress: place.address ?? 'Unknown',
                        ),
                      );
                    },
                  );
                }
                return const Center(child: Text('No places found.'));
              },
            ),
          ),
        ],
      ),
    );
  }

  Container appBar(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 25,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                Icon(
                  Icons.list,
                  color: AppColors.whiteTextColor,
                  size: 25,
                ),
                Text(
                  'Buzzer App',
                  style: TextStyle(
                    color: AppColors.whiteTextColor,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            CustomSearchTextField()
          ],
        ),
      ),
    );
  }
}
