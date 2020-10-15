import 'package:co_working_app/models/category.dart';
import 'package:co_working_app/models/coworking.dart';
import 'package:co_working_app/screens/coworking_details/coworking_detail_screen.dart';
import 'package:co_working_app/theme/icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  List<Coworking> coworkingsData = getCoworkings();
  List<Category> categoriesData = getCategories();

  Widget _buildCategory(BuildContext context, Category category) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Color(category.color),
                borderRadius: BorderRadius.circular(20)
              ),
              child: IconButton(
                icon: Icon(IconData(category.iconCode, fontFamily: 'MaterialIcons')),
                color: Colors.white,
                iconSize: 40,
                onPressed: () {},
              ),
          ),
          SizedBox(height: 10,),
          Text(
            category.name,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }

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
      onTap: () => Navigator.push( /// Lors du clique sur un item pour voir les details du restaurant, on navigue vers une nouvelle page
          context, /// Le contexte a passer au MaterialPageRoute
          MaterialPageRoute(
              builder: (context) => CoworkingDetailScreen(coworking) /// On passe lors de la navigation le restaurant concerner, ///  le builder: (_) underscore represente le contexte
          )
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center, /// Pour aligner les sous composants sur le centre de la stack
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
                        image: AssetImage('assets/images/coworking.jpg'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Container( /// Gradient level definition on container
              height: 310,
              width: 260,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient( /// Linear gradient definition
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ /// Les couleurs avec leur niveau d'opacite du degrade du debut jusqua la fin comme sur photoshop
                        Colors.black.withOpacity(0.3),
                        Colors.black87.withOpacity(0.3),
                        Colors.black54.withOpacity(0.7),
                        Colors.black38.withOpacity(0.7)
                      ],
                      stops: [0.1, 0.7, 0.8, 0.9] /// L'emplacement des couleurs sur la ligne de degrade sur 100 par ex: Colors.black.withOpacity(0.3) => 0.1
                  )
              ),
            ),
            Positioned( /// Definition d'un nouveau widget pour positionner nos elements sur le widget stack, ce widget doit etre toujours sous le widget Stack
              top: 165.0, /// pour placer les sous composants en fonction de la position en bas
              width: 210,
              child: Column( /// Definition d'une colonne pour les textes nom du menu et le prix
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ /// Definition des deux textes nom et prix du menu du restaurant
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
                        fontWeight: FontWeight.bold,
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
                                    image: AssetImage('assets/images/coworking.jpg'),
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
                                    image: AssetImage('assets/images/coworking.jpg'),
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
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                      'LM',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
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
                        'Hi Laura Menzel,',
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
                            _buildCategory(context, getCategories()[0]),
                            _buildCategory(context, getCategories()[1]),
                            _buildCategory(context, getCategories()[2]),
                            _buildCategory(context, getCategories()[3]),
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
