import 'package:cached_network_image/cached_network_image.dart';
import 'package:co_working_app/data/data.dart';
import 'package:co_working_app/models/coworking.dart';
import 'package:co_working_app/screens/coworking_details/coworking_detail_screen.dart';
import 'package:co_working_app/utils/assets_utils.dart';
import 'package:co_working_app/widgets/icone_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  const HomeScreen({
    Key key
  }) : super(key: key);
}

class _HomeState extends State<HomeScreen> {

  List<Coworking> coworkingsData = coworkings();

  Widget _buildSearchTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child:
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 20.0),
              fillColor: Colors.blueGrey[50],
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              hintText: 'Find coworking...',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                    Icons.search,
                    size: 30.0
                ),
              ),
              suffixIcon: Container(
                width: 70,
                color: Colors.transparent,
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 10),
                        child: VerticalDivider(
                          width: 10.0,
                          color: Theme.of(context).primaryColor,
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30.0
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildListRecommendation(BuildContext context, Coworking coworking) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CoworkingDetailScreen(coworking: coworking)
          )
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Hero(
              tag: coworking.coworkingId,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 310,
                width: 260,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(coworking.image),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Container(
              height: 310,
              width: 260,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black87.withOpacity(0.2),
                        Colors.black54.withOpacity(0.7),
                        Colors.black38.withOpacity(0.7),
                        Colors.black38.withOpacity(0.3),
                      ],
                      stops: [0.1, 0.7, 0.8, 0.9]
                  )
              ),
            ),
            Positioned(
              top: 165.0,
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      coworking.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    coworking.city,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.2
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: Container(
                height: 80,
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 25,),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColor
                    ),
                    SizedBox(width: 10,),
                    Text(
                      coworking.rating.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(width: 50,),
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image:  CachedNetworkImageProvider(coworking.participants[0].avatarUrl),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          width: 45,
                          height: 45,
                          left: 30,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(coworking.participants[1].avatarUrl),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          width: 45,
                          height: 45,
                          left: 60,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50),
                                color: Theme.of(context).primaryColor
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                coworking.numberOfMembers.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: SvgPicture.asset(
                getIconMenuAlt05(),
                placeholderBuilder: (context) => CircularProgressIndicator(),
                color: Colors.black87,
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: Container(
                height: 50,
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: currentUser().avatarUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.3), BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                )
              )
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Hi ' + currentUser().name + ',',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: Text(
                        'Where today you\'''ll work ?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 1.2
                        ),
                      ),
                    ),
                    _buildSearchTextField(),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Wrap(
                          spacing: 25,
                          runSpacing: 6,
                          alignment: WrapAlignment.start,
                          children: [
                            IconContainer(category: categories2()[0]),
                            IconContainer(category: categories2()[1]),
                            IconContainer(category: categories2()[2]),
                            IconContainer(category: categories2()[3]),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                  'Recommended for you',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: coworkingsData.length,
                itemBuilder: (BuildContext context, int index) {
                  Coworking coworking = coworkingsData[index];
                  return _buildListRecommendation(context, coworking);
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
