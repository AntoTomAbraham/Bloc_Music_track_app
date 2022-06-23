import 'package:bloc_music/Screens/Savedtracks.dart';
import 'package:bloc_music/Screens/Trackpage.dart';
import 'package:bloc_music/home/home_bloc.dart';
import 'package:bloc_music/model/Saved.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/API.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("See Tracks"),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SavedTracks()));
              },
              child: Icon(Icons.file_open)),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
            child: Column(
          children: [
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc()..add(LoadEvent()),
              child: Container(
                height: MediaQuery.of(context).size.height * .85,
                child: BlocBuilder<HomeBloc, HomeState>(
                    builder: ((context, state) {
                  print(state);
                  if (state is LoadedState) {
                    print("now in loaded state");
                    return ListView.builder(
                        itemCount: state.tracks.length,
                        itemBuilder: (context, index) {
                          return trackTile(
                            context,
                            state.tracks[index].track!.albumName as String,
                            state.tracks[index].track!.artistName as String,
                            state.tracks[index].track!.trackId as int,
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                })),
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget trackTile(
      BuildContext context, String title, String subTitle, int trackId) {
    return Container(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Trackpage(
                    trackID: trackId,
                    trackName: title,
                  )));
        },
        title: Text(title),
        subtitle: Text(
          subTitle,
          style: TextStyle(fontSize: 12),
        ),
        leading: Icon(Icons.music_note),
        trailing: GestureDetector(
            onTap: () {
              final item = Saved(title, subTitle, trackId.toString());
              API.addSaveItems(item);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Music Saved successfully'),
              ));
            },
            child: Icon(Icons.copy)),
      ),
    );
  }
}
