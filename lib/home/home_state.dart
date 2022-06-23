part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class InitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  List<TrackList> tracks;
  LoadedState({required this.tracks});

  @override
  List<Object> get props => [];
}

class ErrorState extends HomeState {
  String? error;
  ErrorState({required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NointernetState extends HomeState {
  String? error;
  NointernetState({required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
