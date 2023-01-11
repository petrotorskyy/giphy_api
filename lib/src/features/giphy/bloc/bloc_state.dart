import '../../../core/api/api_response.dart';

abstract class GiphyState {}

class GiphyInitState extends GiphyState {}

class GiphyLoadedState implements GiphyState {
  final List<Data> data;

  GiphyLoadedState(this.data);
}
