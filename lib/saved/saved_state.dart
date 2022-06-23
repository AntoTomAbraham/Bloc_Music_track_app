part of 'saved_bloc.dart';

abstract class SavedState extends Equatable {
  const SavedState();

  @override
  List<Object> get props => [];
}

class SavedInitial extends SavedState {
  @override
  List<Object> get props => [];
}

class SavedLoad extends SavedState {
  final List<dynamic> savedItems;
  SavedLoad({required this.savedItems});
  List<Object> get props => [savedItems];
}
