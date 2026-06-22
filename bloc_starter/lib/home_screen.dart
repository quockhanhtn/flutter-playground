import 'package:bloc_starter/bloc/counter_bloc.dart';
import 'package:bloc_starter/bloc/counter_event.dart';
import 'package:bloc_starter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Patterns')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            IconButton(
              onPressed: () => {
                context.read<CounterBloc>().add(CounterDecrementEvent()),
              },
              icon: Icon(Icons.remove),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
            IconButton(
              onPressed: () => {
                context.read<CounterBloc>().add(CounterIncrementEvent()),
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
