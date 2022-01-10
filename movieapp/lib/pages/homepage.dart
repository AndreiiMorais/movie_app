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
      body: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Movies',
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
              height: 544,
              child: ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          separatorBuilder: (_, __) => Divider(),
                          shrinkWrap: true,
                          itemCount: movies.listMovie.length,
                          itemBuilder: (_, idx) =>
                              Text(movies.listMovie[idx].title),
                        )
                      : Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
