import 'package:tugas_networking/usecases/get_art_from_api.dart';

void main() async {
  GetArtFromApi getArtFromApi = GetArtFromApi();

  final responseArt = await getArtFromApi(artId: 203128);
  print(responseArt.id);
  print(responseArt.title);
  print(responseArt.imageUrl);
}
