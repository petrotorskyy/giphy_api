abstract class GiphyEvent {}

class GiphyInitEvent extends GiphyEvent {}

class UpdateGiphyEvent extends GiphyEvent {
  final String request;

  UpdateGiphyEvent(this.request);
}
