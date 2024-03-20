import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubits/counter/counter_cubit.dart';

import 'other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'MyCounter Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('counter is ${state.counter}'),
                );
              },
            );
          } else if (state.counter == -1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return OtherPage();
              }),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Text(
              '${state.counter}',
              style: TextStyle(fontSize: 52.0),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            heroTag: 'increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<CounterCubit, CounterState>(
//         listener: (context, state) {
//           if (state.counter == 3) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   content: Text('counter is ${state.counter}'),
//                 );
//               },
//             );
//           } else if (state.counter == -1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) {
//                 return OtherPage();
//               }),
//             );
//           }
//         },
//         child: BlocBuilder<CounterCubit, CounterState>(
//           builder: (context, state) {
//             return Center(
//               child: Text(
//                 '${state.counter}',
//                 style: TextStyle(fontSize: 52.0),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               BlocProvider.of<CounterCubit>(context).increment();
//             },
//             heroTag: 'increment',
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(width: 10.0),
//           FloatingActionButton(
//             onPressed: () {
//               BlocProvider.of<CounterCubit>(context).decrement();
//             },
//             heroTag: 'decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<CounterCubit, CounterState>(
//         builder: (context, state) {
//           if (state.counter == 3) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   content: Text('counter is ${state.counter}'),
//                 );
//               },
//             );
//           } else if (state.counter == -1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) {
//                 return OtherPage();
//               }),
//             );
//           }
//           return Center(
//             child: Text(
//               '${state.counter}',
//               style: TextStyle(fontSize: 52.0),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               BlocProvider.of<CounterCubit>(context).increment();
//             },
//             heroTag: 'increment',
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(width: 10.0),
//           FloatingActionButton(
//             onPressed: () {
//               BlocProvider.of<CounterCubit>(context).decrement();
//             },
//             heroTag: 'decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
//           style: TextStyle(fontSize: 52.0),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               BlocProvider.of<CounterCubit>(context).increment();
//             },
//             heroTag: 'increment',
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(width: 10.0),
//           FloatingActionButton(
//             onPressed: () {
//               BlocProvider.of<CounterCubit>(context).decrement();
//             },
//             heroTag: 'decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
