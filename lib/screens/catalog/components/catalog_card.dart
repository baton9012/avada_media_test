import 'package:avada_test/global_variables.dart';
import 'package:avada_test/models/dress.dart';
import 'package:avada_test/screens/catalog/components/discount_timer.dart';
import 'package:avada_test/screens/catalog/components/rating.dart';
import 'package:avada_test/screens/detail/detail.dart';
import 'package:flutter/material.dart';

class CatalogCard extends StatefulWidget {
  @override
  _CatalogCardState createState() => _CatalogCardState();
}

class _CatalogCardState extends State<CatalogCard> {
  IconData favorite = Icons.favorite_border;
  List<Dress> dresses = List<Dress>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      dresses.add(Dress(
        id: i,
        title: "Scaridian dress",
        pathImg: 'assets/img/full_screen.png',
        isSale: i % 4 == 0,
        price: 500.0,
        salePrice: 300.0,
        isLiked: i % 3 == 0,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: 24.0),
      width: width,
      height: height - 230.0,
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.5,
          mainAxisSpacing: 8.0,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Detail(
                    path: 'assets/img/full_screen.png',
                    id: dresses[index].id,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: index,
                        child: Image.asset('assets/img/image.png'),
                      ),
                      Positioned(
                        left: 110.0,
                        child: IconButton(
                            icon: Icon(dresses[index].isLiked
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: user != null
                                ? () {
                                    setState(() {
                                      dresses[index].isLiked =
                                          !dresses[index].isLiked;
                                    });
                                  }
                                : null),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Scaridian dress'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          '\$300',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        dresses[index].isSale
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '\$200',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                  ),
                  Rating(),
                  dresses[index].isSale ? DiscountTimer() : SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
