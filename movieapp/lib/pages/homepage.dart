import 'package:flutter/material.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import 'package:movieapp/services/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(DioServiceImp()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<Movies>(
      valueListenable: _controller.movies,
      builder: (_, movies, __) {
        return movies != null
            ? ListView.builder(
                itemCount: movies.listMovie.length,
                itemBuilder: (_, idx) => Text(movies.listMovie[idx].title),
              )
            : Container();
      },
    ));
  }
}
