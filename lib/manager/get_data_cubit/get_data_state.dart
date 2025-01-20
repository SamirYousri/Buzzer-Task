import 'package:auth_task/models/place_model.dart';

abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class GetDataLoading extends GetDataState {}

class GetDataLoaded extends GetDataState {
  final List<PlaceModel> places;

  GetDataLoaded(this.places);
}

class GetDataError extends GetDataState {
  final String message;

  GetDataError(this.message);
}
