part of 'trackdetail_bloc.dart';

class TrackdetailState {
  //const TrackdetailState();
  final bool? isAPIfetching;
  final TrackDetail? result;
  TrackdetailState({
    required this.isAPIfetching,
    this.result,
  });
  // @override
  // List<Object> get props => [];
}

class TrackdetailInitial extends TrackdetailState {
  TrackdetailInitial({required bool? isAPIfetching})
      : super(isAPIfetching: isAPIfetching);
}
