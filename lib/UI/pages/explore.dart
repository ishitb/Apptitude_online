import 'dart:math';

import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Search for high quality images from the web!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blueGrey,
                  ),
                  border: InputBorder.none,
                  hintText: "Search a keyword",
                  hintStyle: TextStyle(
                    height: 1.5,
                  ),
                  suffixIcon: _searchText == ""
                      ? null
                      : IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  100,
                      (index) {
                    return Center(
                      child: Container(
                        height: 170,
                        width: 170,
                        color: Color.fromRGBO(
                          Random().nextInt(255),
                          Random().nextInt(255),
                          Random().nextInt(255),
                          Random().nextDouble(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
