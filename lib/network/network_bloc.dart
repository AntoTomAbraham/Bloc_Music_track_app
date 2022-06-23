import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectionInitial()) {
    on<NetworkEvent>((event, emit) async {
      if (event is ListenConnection) {
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          emit(ConnectionSuccess());
        } else {
          emit(ConnectionFailure());
          InternetConnectionChecker().onStatusChange.listen((result) async {
            if (result == InternetConnectionStatus.connected) {
              emit(ConnectionSuccess());
            }
          });
        }
      }
      if (event is ConnectionChanged) {}
      // TODO: implement event handler
    });
  }
}
