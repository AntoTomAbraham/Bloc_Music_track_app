import 'dart:convert';

import 'package:bloc_music/data/config.dart';
import 'package:bloc_music/model/Saved.dart';
import 'package:bloc_music/model/TrackDetail.dart';
import 'package:bloc_music/model/Tracks.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<List<TrackList>?> fetchTracks() async {
    print("inisde fetchTrackk");
    var url = Uri.parse(Config.trackAPI);
    var response = await http.get(
      url,
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<TrackList>? tracks = Tracks.fromJson(data).message!.body!.trackList;
      return tracks;
    } else {
      throw Exception('Failed to load Tracks');
    }
  }

  static Future<TrackDetail> fetchTrackDetail(String trackID) async {
    print("inisde fetchTrackk");
    var url = Uri.parse(
        'https://api.musixmatch.com/ws/1.1/track.get?track_id=${trackID}&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7');
    var response = await http.get(
      url,
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return TrackDetail.fromJson(data);
      //List<TrackList>? tracks = Tracks.fromJson(data).message!.body!.trackList;
      //return tracks;
    } else {
      throw Exception('Failed to load Tracks');
    }
  }

  static Box<Saved>? saveBox;
  static Future<void> openBOx() async {
    saveBox = await Hive.openBox<Saved>('save_box');
  }

  static List<dynamic> getSavedItems() {
    openBOx();
    final save = saveBox!.values.toList();
    //print(save.toList());
    saveBox!.close();
    return save;
  }

  static Future<void> addSaveItems(Saved item) async {
    final saveDB = await Hive.openBox('save_box');
    saveDB.add(item);
    print(saveDB.length);
    saveDB.close();
  }
}
