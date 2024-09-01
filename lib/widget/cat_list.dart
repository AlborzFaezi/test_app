import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/bloc/cat_cubit.dart';

import '../bloc/cat_state.dart';




class CatList extends StatefulWidget {
  const CatList({super.key});

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {

  TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);

  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }


  void _onSearchChanged() {
    context.read<CatCubit>().filterCats(searchController.text);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              context.read<CatCubit>().filterCats(query);
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<CatCubit, CatState>(
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
          ),
        ),
      ],
    );
  }
}
