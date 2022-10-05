import 'package:get_it/get_it.dart';
import 'package:tugas_networking/constants/art_id.dart';
import 'package:tugas_networking/cubits/arts_cubit.dart';
import 'package:tugas_networking/usecases/get_art_from_api.dart';

import 'entities/art.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  GetArtFromApi getArtFromApi = GetArtFromApi();
  List<Art> listArt = [];
  for (int i = 0; i < 10; i++) {
    Art responseArt = await getArtFromApi(artId: listId[i]);

    if (responseArt.id != -1) {
      listArt.add(responseArt);
    }
  }

  getIt.registerSingleton(ArtCubit(listArt));
}
