import 'package:hive/hive.dart';
part 'Saved.g.dart';

@HiveType(typeId: 1)
class Saved {
  @HiveField(0)
  final String albumName;
  @HiveField(1)
  final String artistName;
  @HiveField(2)
  final String trackID;
  Saved(this.albumName, this.artistName, this.trackID);
}
