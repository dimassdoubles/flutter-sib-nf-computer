import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tugas_networking/cubits/arts_cubit.dart';
import 'package:tugas_networking/injections.dart';

import '../entities/art.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ArtCubit artCubit = getIt<ArtCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: MasonryGridView.count(
            itemCount: artCubit.state.length,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            itemBuilder: (context, index) {
              return BlocBuilder(
                bloc: artCubit,
                builder: (context, state) =>
                    GridItem(art: artCubit.state[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  Art art;

  GridItem({
    Key? key,
    required this.art,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(art.imageUrl),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(art.title),
        ),
      ],
    );
  }
}
