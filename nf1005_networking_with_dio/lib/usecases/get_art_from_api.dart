import 'package:dio/dio.dart';
import 'package:tugas_networking/entities/art.dart';

class GetArtFromApi {
  String endPoint =
      "https://api.artic.edu/api/v1/artworks/";
  String fields = "?fields=id,title,image_id";

  GetArtFromApi();

  Future<Art> call({required int artId}) async {
    try {
      var response = await Dio().get("$endPoint$artId$fields");

      int id = response.data["data"]["id"];
      String title = response.data["data"]["title"];

      // get imageUrl (example : https://api.artic.edu/api/v1/artworks/159136?fields=id,title,image_id )
      String imageId = response.data["data"]["image_id"];
      String iiifUrl = response.data["config"]["iiif_url"];
      String suffix = "/full/843,/0/default.jpg";

      String imageUrl = "${iiifUrl}/$imageId$suffix";

      return Art(id: id, imageUrl: imageUrl, title: title);
    } catch (e) {
      return Art(id: -1, imageUrl: "", title: "");
    }
  }
}
