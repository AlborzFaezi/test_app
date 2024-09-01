import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/widget/cat_list.dart';
import '../bloc/cat_cubit.dart';
import '../repository/cat_repository.dart';
import '../api/cat_api_provider.dart';
import 'package:dio/dio.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cat List',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.cyan,
      ),
      body: BlocProvider(
        create: (_) {
          final catCubit = CatCubit(CatRepository(CatApiProvider(Dio())));
          catCubit.loadCats();
          return catCubit;
        },
        child: CatList(),
      ),
    );
  }
}


