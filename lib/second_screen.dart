import 'package:bloc_issue/bloc/simple_cubit.dart';
import 'package:bloc_issue/bloc/simple_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  late final SimpleCubit _cubit;

  @override
  void initState() {
    _cubit = context.read();
    _cubit.simulateApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // Add a back button
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
          title: const Text(
              'Second Screen'), // Replace 'Your Title' with your desired title
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'PRESS BACK WHEN LOADING, IT WILL CRASH',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.red),
              ),
              const SizedBox(height: 30),
              BlocBuilder<SimpleCubit, SimpleState>(
                builder: (context, state) {
                  if (state is SimpleStateLoading) {
                    return const Text(
                      'Loading ... ',
                      style: TextStyle(fontSize: 18),
                    );
                  } else if (state is SimpleStateLoaded) {
                    return const Text(
                      'Loaded Succesfully',
                      style: TextStyle(fontSize: 18),
                    );
                  } else {
                    return const Text(
                      'Initial State',
                      style: TextStyle(fontSize: 18),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
