import 'package:bloc/bloc.dart';
import 'package:tugas_networking/entities/art.dart';

class ArtCubit extends Cubit<List<Art>> {
  ArtCubit(List<Art> listArt) : super(listArt);

  void addArt(Art art) {
    emit([...state, art]);
  }
}
