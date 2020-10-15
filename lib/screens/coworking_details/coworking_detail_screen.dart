import 'package:co_working_app/models/coworking.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CoworkingDetailScreen extends StatefulWidget {

  final Coworking coworking;

  CoworkingDetailScreen(this.coworking);

  @override
  _CoworkingDetailScreenState createState() => _CoworkingDetailScreenState();
}

class _CoworkingDetailScreenState extends State<CoworkingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack( /// Definition du composant qui permettra de mettre des composants par dessus, comme les icones sur l'image
            children: <Widget>[ /// Definition des sous enfants du composant
              Hero( /// Mise en place de l'image du resto dans hero pour faire de l'animation lors de la transition de l'item du resto vers la nouvelle page de details du resto
                tag: widget.coworking.coworkingId,
                child: Image(
                  height: 220.0, /// Pour definir la longueur de l'image du resto
                  width: MediaQuery.of(context).size.width, /// Pour definir la largeur de l'image en fonction de la taille du telephone
                  image: AssetImage(widget.coworking.image), /// Pour acceder au restaurant qui a ete passer en parametre lors de la navigation vers cette page on utilise (widget)
                  fit: BoxFit.cover, /// Pour couvrir toute la partie par l'image
                ),
              ),
              Padding( /// Definition d'un padding pour la ligne sur les icones go back et favoris.
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0), /// Pour les marges internes vertical et horizontal de la ligne sur les icones
                child: Row( /// Definition d'un nouveau composant pour les deux boutons go back et favoris
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6), /// Pour selectionner la couleur primaire definis dans le main et mettre une opacite de 70%
                          borderRadius: BorderRadiusDirectional.circular(50.0)
                      ),
                      child: IconButton( /// Definition du bouton avec icone go back sur la nouvelle ligne
                        icon: Icon(Icons.arrow_back),
                        color: Theme.of(context).primaryColor,
                        iconSize: 30.0,
                        onPressed: () => Navigator.pop(context), /// Lors du clique sur le bouton go back il fait un retour a la page precedente a travers le context
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6), /// Pour selectionner la couleur primaire definis dans le main et mettre une opacite de 70%
                          borderRadius: BorderRadiusDirectional.circular(50.0)
                      ),
                      child: IconButton( /// Definition du bouton avec icone go back sur la nouvelle ligne
                        icon: Icon(MdiIcons.axisZRotateCounterclockwise),
                        color: Theme.of(context).primaryColor,
                        iconSize: 30.0,
                        onPressed: () => Navigator.pop(context), /// Lors du clique sur le bouton go back il fait un retour a la page precedente a travers le context
                      ),
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                builder: (context, controller) {
                  return Container(
                    color: Colors.red,
                    child: ListView.builder(
                      itemCount: 10,
                      controller: controller,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          title: Text('Item ${index+1}'),
                        );
                      }
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
