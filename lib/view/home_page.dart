import 'package:amaliyot/cubit/home_state.dart';
import 'package:amaliyot/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) =>
            _HomeScaffold(context: context, state: state));
  }
}

// ignore: must_be_immutable
class _HomeScaffold extends StatelessWidget {
  BuildContext context;
  HomeState state;
  _HomeScaffold({super.key, required this.context, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clean Architekture"),
        ),
        body: Builder(builder: (context) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text((state as HomeErrorState).error),
            );
          } else if (state is HomeCompleteState) {
            List<CurrencyModel> data=(state as HomeCompleteState).currency;
            return RefreshIndicator(
              onRefresh: context.read<HomeCubit>().updateCurrency,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].title.toString()),
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        }));
  }
}
