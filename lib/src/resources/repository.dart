import 'dart:async';
import 'package:flutter_bloc_state_management/src/resources/dongey_api_provider.dart';

import 'movie_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();


}