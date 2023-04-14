import 'package:flutter/material.dart';
import 'Api_request_response.dart';
import 'Article_model_class.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Products",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
        body: FutureBuilder<List<products>>(
            future: client.getproducts(),
            builder: (BuildContext context, AsyncSnapshot<List<products>> snapshot)
            {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,

                      itemBuilder: (context, index) {
                        var Products = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(11),
                          child: Column(children: [

                            snapshot.data![index].thumbnail != null?
                            Container(
                              height: 150,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data![index].thumbnail.toString(),
                                      ),
                                      fit: BoxFit.fitWidth),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                  Border.all(color: Colors.blueGrey, width: 2)),
                            ):
                            Container(
                              height: 150,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage("https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg"
                                      ),
                                      fit: BoxFit.fitWidth),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                  Border.all(color: Colors.blueGrey, width: 2)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              snapshot.data![index].title.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              snapshot.data![index].description.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 9),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(mainAxisAlignment: MainAxisAlignment
                                      .start,
                                      children: [
                                        Text(
                                          "Category",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Brand",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          "Price",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          "Discount %",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          "Rating",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          "Stock",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                      ]),
                                  Column(mainAxisAlignment: MainAxisAlignment
                                      .start,
                                      children: [
                                        Text(
                                          snapshot.data![index].category.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          snapshot.data![index].brand.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          snapshot.data![index].price.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          snapshot.data![index].discountPercentage.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          snapshot.data![index].rating.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          snapshot.data![index].stock.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),

                                      ]),
                                ],
                              ),
                            ),
                          ]),
                        );
                      }),
                );
              }
              print(snapshot.data);
              print(snapshot.hasData);

              return Center(child: CircularProgressIndicator()
              );

            }));
  }
}
