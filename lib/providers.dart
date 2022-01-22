import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/api_call.dart';

import 'Clock.dart';
import 'model.dart';

final numberProvider = Provider<int>((ref){
  return 343;
});

final numberStateProvider = StateProvider<int>((ref){
  print('pressed');
  return 0;
});

final apiProviderCall = FutureProvider<Model>((red) async{
  APICall apiCall = APICall();
  //Model model = await apiCall.getData();
  Model model = Model(name: '', roll: '');
  return model;
});


final futureStateProvider = StateProvider<FutureProvider<Model>>((ref){

  return FutureProvider<Model>((red) async{
    APICall apiCall = APICall();
    Model model = await apiCall.getData();
    return model;
  });
});


final clockProvider = StateNotifierProvider.autoDispose<Clock, DateTime>((ref) {

  return Clock();
});


void inc(WidgetRef ref) async{
  ref.watch(futureStateProvider.state).state;
  ref.watch(numberStateProvider.state).state++;
}