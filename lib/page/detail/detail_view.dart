import 'dart:math';

import 'package:e_commerce/page/detail/detail_cubit.dart';
import 'package:e_commerce/page/product_detail/product_detail_view.dart';
import 'package:e_commerce/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStore extends StatelessWidget {
  String title;
  String id;
  DetailStore({Key? key, required this.title, required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit(Repository()),
      child: _Widget(
        title: title,
        id: id,
      ),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Products " + title),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state is DetailInitial) {
            context.read<DetailCubit>().getData(id);
          } else if (state is DetailLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailSuccess) {
            return Container(
              child: GridView.builder(
                  itemCount: state.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    ProductsView(model: state.data[index])));
                      },
                      child: Container(
                        color: Colors.grey[100],
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                FadeInImage(
                                  placeholder: AssetImage("assets/dummy.png"),
                                  image: NetworkImage(
                                      state.data[index].images![0].toString()),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 5,
                                  child: InkWell(
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text("Comming soon!")));
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                state.data[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "\$ " + state.data[index].price!.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else if (state is DetailError) {
            return Center(
              child: Text(state.error),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
