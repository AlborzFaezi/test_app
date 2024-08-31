import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cat_cubit.dart';
import '../bloc/cat_state.dart';
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


class CatList extends StatelessWidget {
  const CatList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        if (state is CatLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CatLoaded) {
          final cats = state.cats;
          return ListView.builder(
            itemCount: cats.length,
            itemBuilder: (context, index) {
              final cat = cats[index];
              return Card(
                color: Colors.blueAccent,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 4.0,
                child: ListTile(
                  onTap: (){
                    Navigator.pushNamed(
                      context,
                      '/catImage',
                      arguments: cat.id ?? '',
                    );
                  },
                  contentPadding: EdgeInsets.all(16.0),
                  leading: Icon(Icons.pets, size: 40.0, color: Colors.white),
                  title: Text(
                    cat.id ?? 'Unknown',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.storage, size: 16.0, color: Colors.white),
                          SizedBox(width: 4.0),
                          Text('${cat.size ?? 0} bytes', style: TextStyle(color: Colors.yellow)),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        children: [
                          Icon(Icons.tag, size: 16.0, color: Colors.white),
                          SizedBox(width: 4.0),
                          Text('Tags: ${cat.tags?.join(', ') ?? 'No tags available'}', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is CatError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }
}
