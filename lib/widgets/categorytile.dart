import 'package:flutter/material.dart';
import 'package:wallpix/screens/searchedpage.dart';
class CategoryTile extends StatelessWidget {
  var index;
  CategoryTile(this.index);

  List type = [
    "Nature", "HD","Street","Cars","Code","Anime","Dark","marvel"
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap:( )=> {
        Navigator.of(context).push(
          MaterialPageRoute<Null> (
            builder: (context){
              return SearchedPage(type[index]);
            }
          )
        )
      },
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          height: height / 20,
          width: width/5,
          child: Center(child: Text(type[index],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
          ),
          ),)
        )
      ),
    );
  }
}