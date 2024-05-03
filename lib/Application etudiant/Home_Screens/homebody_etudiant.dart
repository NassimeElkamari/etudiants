// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:application_gestion_des_reclamations_pfe/Application%20etudiant/AjouterReclamation.dart';
import 'package:application_gestion_des_reclamations_pfe/Application%20etudiant/liste_sites_facult%C3%A9.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBodyEtudiant extends StatefulWidget {
  const HomeBodyEtudiant({Key? key}) : super(key: key);

  @override
  State<HomeBodyEtudiant> createState() => _HomeBodyEtudiantState();
}

class _HomeBodyEtudiantState extends State<HomeBodyEtudiant> {


  // Fonction pour ouvrir le site web
  Future<void> openAppBrowserView(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset("images/education (2).png"),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 204, 243),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher...',
                hintStyle: TextStyle(color: Color.fromARGB(255, 99, 161, 255)),
                icon: Icon(Icons.search,
                    color: Color.fromARGB(255, 99, 161, 255)),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                // Ajoutez ici la logique de recherche en fonction de la valeur saisie
              },
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 16),

                //liste des réclamations
                Cas_Utilisation(context, "images/liste.png",
                    "Liste de mes réclamations ", () => AjouterReclamation()),
                SizedBox(width: 16),

                //liste des cours
                Cas_Utilisation(context, "images/liste_cours.png",
                    "Liste des cours", () => AjouterReclamation()),
                SizedBox(width: 16),

                //liste des offres travail pour les étudiants
                GestureDetector(
                  onTap: () {
                     openAppBrowserView('https://www.emploi.ma');

                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 206, 121, 255)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 6),
                        Image.asset("images/liste offre travail.png",
                            height: 80),
                        SizedBox(height: 6),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Voir des offres d'emploi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 45, 28, 90),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 16),


                //open page facultes des sciences
                GestureDetector(
                  onTap: () {
                     openAppBrowserView('https://www.fst.ac.ma/site');

                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 206, 121, 255)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 6),
                        Image.asset("images/actualits facultes.png",
                            height: 80),
                        SizedBox(height: 6),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Consulter les actualités de la faculté",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 45, 28, 90),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 16),
                //liste des applications liee a la facultes
                Cas_Utilisation(context, "images/liste_cours.png",
                    "Accès aux sites  de la faculté", () => SitesFaculte()),
                SizedBox(width: 16),
                

              ],
            ),
          ),
          SizedBox(height: 30),

          //button ajouter reclamations
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 241, 210, 255),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AjouterReclamation(),
                    ),
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }

  GestureDetector Cas_Utilisation(BuildContext context, String imagePath,
      String title, Widget Function() chemin) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => chemin(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 206, 121, 255).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 6),
            Image.asset(imagePath, height: 80),
            SizedBox(height: 6),
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 179, 163, 223),
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}