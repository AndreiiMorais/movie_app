import 'package:flutter/material.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/pages/details_page.dart';
import 'package:movieapp/utils/apis_utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DetailsPage(
                movie: movie,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black54,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Hero(
                  //responsavel por fazer a transiçao "aumentando" a imagem
                  tag: movie.id, //a tag precisa ser id UNICO
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) {
                        return child;
                      } else {
                        return const CircularProgressIndicator.adaptive();
                        //adaptive se adapta para a plataforma
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const Spacer(), // ocupa o espaço disponivel e joga o de baixo pro final
                      Text(
                        'Popularidade ' + movie.popularity.toString(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Avaliação Média: ' + movie.voteAverage.toString(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
