import 'package:bloc/bloc.dart';
import 'package:bloc_music/data/API.dart';
import 'package:bloc_music/home/home_bloc.dart';
import 'package:bloc_music/model/TrackDetail.dart';
import 'package:equatable/equatable.dart';

part 'trackdetail_event.dart';
part 'trackdetail_state.dart';

class TrackdetailBloc extends Bloc<TrackdetailEvent, TrackdetailState> {
  TrackdetailBloc()
      : super(TrackdetailInitial(
          isAPIfetching: false,
        )) {
    on<fetchTrackdetail>((fetchTrackdetail event, emit) async {
      emit(TrackdetailInitial(isAPIfetching: true));
      final TrackDetail data = await API.fetchTrackDetail(event.trackID);
      emit(TrackdetailState(isAPIfetching: false, result: data));
    });
  }
}
