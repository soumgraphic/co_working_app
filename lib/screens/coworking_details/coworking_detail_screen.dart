import 'package:cached_network_image/cached_network_image.dart';
import 'package:co_working_app/data/data.dart';
import 'package:co_working_app/models/category.dart';
import 'package:co_working_app/models/coworking.dart';
import 'package:co_working_app/widgets/icone_container.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CoworkingDetailScreen extends StatefulWidget {
  final Coworking coworking;

  CoworkingDetailScreen({this.coworking});

  @override
  _CoworkingDetailScreenState createState() => _CoworkingDetailScreenState();
}

class _CoworkingDetailScreenState extends State<CoworkingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.coworking.coworkingId,
            child: Image(
              height: 220.0,
              width: MediaQuery.of(context).size.width,
              image:  CachedNetworkImageProvider(widget.coworking.image),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadiusDirectional.circular(50.0)),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Theme.of(context).primaryColor,
                    iconSize: 30.0,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadiusDirectional.circular(50.0)),
                  child: IconButton(
                    icon: Icon(MdiIcons.axisZRotateCounterclockwise),
                    color: Theme.of(context).primaryColor,
                    iconSize: 30.0,
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.70,
            minChildSize: 0.70,
            maxChildSize: 0.75,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 8,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(50.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 25, right: 25, bottom: 15),
                            child: Text(
                              widget.coworking.name,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 30),
                            child: Text(
                              widget.coworking.address,
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black38),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconContainer(category: widget.coworking.coworkingEquipments[0]),
                                IconContainer(category: widget.coworking.coworkingEquipments[1]),
                                IconContainer(category: widget.coworking.coworkingEquipments[2]),
                                IconContainer(category: widget.coworking.coworkingEquipments[3])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        widget.coworking.user.name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      widget.coworking.user.position + ' ' + widget.coworking.name,
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 60,
                                    width: 60,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          widget.coworking.user.avatarUrl,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.3),
                                                  BlendMode.colorBurn)),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(35),
                                  topLeft: Radius.circular(35))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25, top: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                          'Price',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    Text(
                                        '\$' + widget.coworking.price.toString() +'/hour',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0),
                                        side: BorderSide(color: Theme.of(context).primaryColor)),
                                    onPressed: () {},
                                    color: Theme.of(context).primaryColor,
                                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                                    textColor: Colors.white,
                                    child: Text(
                                        "Contact Now!",
                                        style: TextStyle(fontSize: 16)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ));
            },
          )
        ],
      ),
    );
  }
}
