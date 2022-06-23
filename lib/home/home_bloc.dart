import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../data/API.dart';
import '../model/Tracks.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingState()) {
    on((event, emit) async {
      try {
        emit(LoadingState());
        print("Inside fetchtrack try");
        final track = await API.fetchTracks();
        emit(LoadedState(tracks: track as List<TrackList>));
      } catch (e) {
        print("Some error happended");
        emit(ErrorState(error: e.toString()));
      }
    });
  }
}
