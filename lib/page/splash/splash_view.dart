import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_commerce/page/store/store_view.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/splash.jpg"),
            fit: BoxFit.cover,
          )),
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: BlurryContainer(
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(
                        children: [
                          Text(
                            "Store's Twins",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Belanja semua kebutuhanmu disini",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    blur: 5,
                    elevation: 0,
                    width: MediaQuery.of(context).size.width - 40,
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    color: Color.fromARGB(71, 0, 0, 0),
                    borderRadius: BorderRadius.circular(40)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          backgroundColor: Colors.black,
                          primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => StorePage()));
                      },
                      child: Container(
                        height: 50,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Explore Now",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
