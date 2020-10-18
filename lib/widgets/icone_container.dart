import 'package:co_working_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconContainer extends StatelessWidget {
  final Category category;

  const IconContainer({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  color: Color(category.color),
                  borderRadius: BorderRadius.circular(20)),
              child: Align(
                  alignment: Alignment.center,
                  child: category.iconPath.isNotEmpty
                      ? SvgPicture.asset(
                          category.iconPath,
                          placeholderBuilder: (context) =>
                              CircularProgressIndicator(),
                          color: category.iconColor != 0
                              ? Color(category.iconColor)
                              : Colors.white,
                          height: 35,
                          width: 35,
                        )
                      : IconButton(
                          icon: Icon(category.icon),
                          color: category.iconColor != 0
                              ? Color(category.iconColor)
                              : Colors.white,
                          iconSize: 40,
                          onPressed: () {},
                        ))),
          SizedBox(
            height: 10,
          ),
          Text(
            category.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
