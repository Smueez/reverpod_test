import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/providers.dart';

import 'model.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider);
    var numberState = ref.watch(numberStateProvider);
    final model = ref.watch(apiProviderCall);
    final currentTime = ref.watch(clockProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(numberState.toString()),
            model.when(
                data: (val){
                  Map data = val.toJson();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name ${data['name']}'),
                      const SizedBox(height: 20,),
                      Text('Roll ${data['roll']}')
                    ],
                  );
                },
                error: (error, stack){
                  return const Text('Error');
                },
                loading: () => const CircularProgressIndicator()
            ),
            Text(currentTime.second.toString()),
            SizedBox(height: 20,),
            TextButton(
                onPressed: () {
                  inc(ref);

                } ,
                child: const Text('Increment')
            ),
            ElevatedButton (
              onPressed: (){

              },
              child: const Text('Get Data'),
            )
          ],
        )
      ),
    );
  }
}
