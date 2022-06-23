import 'package:bloc_music/Trackdetail/trackdetail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Trackpage extends StatelessWidget {
  int trackID;
  String trackName;
  Trackpage({required this.trackID, required this.trackName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trackName),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
            child: Column(
          children: [
            BlocProvider<TrackdetailBloc>(
              create: (context) => TrackdetailBloc()
                ..add(fetchTrackdetail(trackID: trackID.toString())),
              child: Container(
                height: MediaQuery.of(context).size.height * .85,
                child: BlocBuilder<TrackdetailBloc, TrackdetailState>(
                    builder: ((context, state) {
                  // if (state.isAPIfetching == true) {
                  //   return Center(child: CircularProgressIndicator());
                  // } else {
                  if (state.result != null && state.isAPIfetching == false) {
                    // print(state.result!.message!.body!.track!.albumId);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headerText("AlbumName"),
                            showtext(state
                                .result!.message!.body!.track!.albumName
                                .toString()),
                            SizedBox(height: 20),
                            headerText("ArtistName"),
                            showtext(state
                                .result!.message!.body!.track!.artistName
                                .toString()),
                            SizedBox(height: 20),
                            headerText("Rating"),
                            showtext(state
                                .result!.message!.body!.track!.trackRating
                                .toString()),
                            SizedBox(height: 20),
                            // headerText("AlbumName"),
                            // showtext(
                            //     state.result!.message!.body!.track!.toString()),
                            // SizedBox(height: 20),
                            // headerText("AlbumName"),
                            // showtext(state
                            //     .result!.message!.body!.track!.artistName
                            //     .toString()),
                            // SizedBox(height: 20)
                          ],
                        ),
                      ),
                    );
                    // }
                  }
                  return Center(child: CircularProgressIndicator());
                })),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget headerText(String data) {
    return Text(
      data,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget showtext(String data) {
    return Text(
      data,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    );
  }
}
