import 'package:bloc_music/Screens/Trackpage.dart';
import 'package:bloc_music/saved/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedTracks extends StatelessWidget {
  const SavedTracks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
            child: Column(
          children: [
            BlocProvider<SavedBloc>(
                create: (context) => SavedBloc()..add(LoadSavedItems()),
                child: Container(
                  child: BlocBuilder<SavedBloc, SavedState>(
                      builder: (context, state) {
                    print(state);
                    if (state is SavedLoad && state.savedItems.isNotEmpty) {
                      return Container(
                        height: MediaQuery.of(context).size.height * .85,
                        child: ListView(
                            children: state.savedItems.map((e) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Trackpage(
                                        trackID: int.parse(e.trackID),
                                        trackName: e.artistName,
                                      )));
                            },
                            title: Text(e.albumName.toString()),
                            subtitle: Text(e.artistName.toString()),
                          );
                        }).toList()),
                      );
                    } else if (state == null) {
                      return Center(child: Text("No favourites"));
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
                ))
          ],
        )),
      ),
    );
  }
}
