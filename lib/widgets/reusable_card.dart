import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,

  }) : super(key: key);


  final String title;
  final String description;
  final String imagePath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Column(
          children: [
            SizedBox(height: 80),
            Container(
              height: 350,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                elevation: 8,
                color: Colors.purple[400],
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          onTap();
                        },
                        child: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.shade500,
                                blurRadius: 5,
                              ),
                            ],
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Icon(
                            Icons.arrow_forward_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Image.asset(
          imagePath,
          height: 140,
        ),
      ],
    );
  }
}
