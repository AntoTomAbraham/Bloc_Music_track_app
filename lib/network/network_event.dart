part of 'network_bloc.dart';

// abstract class NetworkEvent extends Equatable {
//   const NetworkEvent();

//   @override
//   List<Object> get props => [];
// }

abstract class NetworkEvent {}

class ListenConnection extends NetworkEvent {}

class ConnectionChanged extends NetworkEvent {
  NetworkState connection;
  ConnectionChanged(this.connection);
}
