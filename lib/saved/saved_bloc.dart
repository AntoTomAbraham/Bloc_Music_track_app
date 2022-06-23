import 'package:bloc/bloc.dart';
import 'package:bloc_music/model/Saved.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/API.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedInitial()) {
    on<LoadSavedItems>((event, emit) async {
      final saveBox = await Hive.openBox<Saved>('save_box');
      final save = saveBox.values.toList().toSet().toList();
      saveBox.close();
      //final items = API.getSavedItems();
      print("getting items");
      print(save);
      emit(SavedLoad(savedItems: save));
      // TODO: implement event handler
    });
  }
}
