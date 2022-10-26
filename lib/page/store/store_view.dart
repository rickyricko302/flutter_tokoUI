import 'dart:math';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_commerce/page/detail/detail_view.dart';
import 'package:e_commerce/data/model/model_toko.dart';
import 'package:e_commerce/data/repository.dart';
import 'package:e_commerce/page/store/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(Repository()),
      child: _Widget(),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categori",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Stack(children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications_outlined)),
                        Positioned(
                            right: 17,
                            top: 17,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20)),
                            )),
                      ]),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            "https://media.istockphoto.com/photos/shot-of-a-young-businessman-using-his-digital-tablet-picture-id1369338497?b=1&k=20&m=1369338497&s=170667a&w=0&h=TKwVut85bCbllxEdl0JFxFwIvc-jUhIcyFtSyNpTWCY="),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    hintText: "Search Category",
                    fillColor: Color.fromARGB(255, 245, 243, 243),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
            BlocBuilder<StoreCubit, StoreState>(
              builder: (context, state) {
                if (state is StoreInitial) {
                  context.read<StoreCubit>().getData();
                } else if (state is StoreLoading) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is StoreSuccess) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return ItemCategory(
                            model: state.data[index],
                          );
                        }),
                  );
                } else if (state is StoreError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.error),
                    ),
                  );
                }
                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  ModelToko model;
  ItemCategory({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailStore(
                      title: model.name!,
                      id: model.id!.toString(),
                    )));
      },
      child: Container(
          margin: EdgeInsets.all(20),
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage("assets/dummy.png"),
                  image: NetworkImage(
                    model.image!,
                  )),
            ),
            Positioned(
              bottom: 0,
              child: BlurryContainer(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        Random().nextInt(200).toString() + " product",
                        style: TextStyle(
                            color: Color.fromARGB(255, 224, 222, 222)),
                      )
                    ]),
                blur: 5,
                elevation: 0,
                width: MediaQuery.of(context).size.width - 40,
                padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                color: Color.fromARGB(71, 0, 0, 0),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            ),
          ])),
    );
  }
}
