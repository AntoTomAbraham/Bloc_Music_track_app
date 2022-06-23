part of 'trackdetail_bloc.dart';

abstract class TrackdetailEvent extends Equatable {
  const TrackdetailEvent();

  @override
  List<Object> get props => [];
}

class fetchTrackdetail extends TrackdetailEvent {
  String trackID;
  fetchTrackdetail({required this.trackID});
}
