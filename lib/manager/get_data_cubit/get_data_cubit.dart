// ignore_for_file: depend_on_referenced_packages

// import 'package:auth_task/manager/get_data_cubit/get_data_state.dart';
// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class GetDataCubit extends Cubit<GetDataState> {
//   GetDataCubit() : super(GetDataInitial());

//   final CollectionReference placesCollection =
//       FirebaseFirestore.instance.collection('allPlaces');

//   void fetchPlaces() async {
//     emit(GetDataLoading());
//     try {
//       QuerySnapshot snapshot = await placesCollection.get();
//       final places = snapshot.docs
//           .map((doc) => doc.data() as Map<String, dynamic>)
//           .toList();
//       emit(GetDataLoaded(places));
//     } catch (e) {
//       emit(GetDataError('Failed to fetch places: $e'));
//     }
//   }
// }

import 'package:auth_task/manager/get_data_cubit/get_data_state.dart';
import 'package:auth_task/models/place_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  final CollectionReference placesCollection =
      FirebaseFirestore.instance.collection('allPlaces');

  void fetchPlaces() async {
    emit(GetDataLoading());
    try {
      QuerySnapshot snapshot = await placesCollection.get();

      final places = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return PlaceModel.fromMap(data);
      }).toList();

      emit(GetDataLoaded(places));
    } catch (e) {
      emit(GetDataError('Failed to fetch places: $e'));
      print(e);
    }
  }
}
