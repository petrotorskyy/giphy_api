import 'package:flutter_bloc/flutter_bloc.dart';
import '/src/features/giphy/bloc/bloc_event.dart';
import '/src/features/giphy/bloc/bloc_state.dart';

import '../../../core/data/data_source.dart';

class GiphyBloc extends Bloc<GiphyEvent, GiphyState> {
  GiphyBloc() : super(GiphyInitState()) {
    on<UpdateGiphyEvent>(onGiphyEvent);
  }

  Future<void> onGiphyEvent(
    UpdateGiphyEvent event,
    Emitter<GiphyState> emit,
  ) async {
    final result = await DataSource().getData(event.request);
    emit(GiphyLoadedState(result));
  }
}
