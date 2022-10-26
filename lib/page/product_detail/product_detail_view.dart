import 'package:e_commerce/data/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class ProductsView extends StatelessWidget {
  ProductModel model;
  ProductsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 400,
                        child: PageIndicatorContainer(
                          child: PageView(
                              children: List.generate(
                                  model.images!.length,
                                  (index) => Image.network(
                                        model.images![index],
                                        fit: BoxFit.cover,
                                      ))),
                          align: IndicatorAlign.bottom,
                          length: model.images!.length,
                          indicatorSpace: 20.0,
                          padding: const EdgeInsets.all(10),
                          indicatorColor: Colors.white,
                          indicatorSelectorColor: Colors.orange,
                          shape: IndicatorShape.circle(size: 10),
                        ),
                      ),
                      Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            model.title!,
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite_border))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "\$ " + model.price.toString(),
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 15, right: 20, bottom: 75),
                    child: Text(
                      model.description!,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                right: 20,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Container(
                              height: 50,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ))),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(60)),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
