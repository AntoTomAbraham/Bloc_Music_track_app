part of 'saved_bloc.dart';

abstract class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object> get props => [];
}

class LoadSavedItems extends SavedEvent {
  @override
  List<Object> get props => [];
}
