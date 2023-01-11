import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/src/core/const/app_strings.dart';
import '/src/core/const/delayed_action.dart';

import '../../../core/api/api_response.dart';
import '../bloc/bloc_bloc.dart';
import '../bloc/bloc_event.dart';
import '../bloc/bloc_state.dart';

class GiphyScreen extends StatefulWidget {
  const GiphyScreen({super.key});

  @override
  State<GiphyScreen> createState() => _GiphyScreenState();
}

class _GiphyScreenState extends State<GiphyScreen> {
  var items = <Data>[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GiphyBloc, GiphyState>(
      listener: (context, state) {
        if (state is GiphyLoadedState) {
          items = state.data;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(labelText: AppStrings.searchText),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: onSearch,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => Card(
                    child: CachedNetworkImage(
                      imageUrl: items[index].images?.downsizedMedium?.url ?? '',
                      placeholder: (BuildContext context, String url) =>
                          const Placeholder(
                        fallbackWidth: 320,
                        fallbackHeight: 240,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onSearch(String request) {
    DelayedAction.run(() {
      BlocProvider.of<GiphyBloc>(context).add(UpdateGiphyEvent(request));
    });
  }
}
