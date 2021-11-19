import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.lightGreen.withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              color: Colors.lightGreen,
              image: const DecorationImage(
                  image: AssetImage("assets/gals/iasi.png"), fit: BoxFit.cover),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
              width: double.infinity,
              height: 2,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Nume Oras",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(200, 255, 255, 255)),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height / 13,
            width: MediaQuery.of(context).size.width - 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/gals/icons/hospital.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/gals/icons/insta.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/gals/icons/arrow.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/gals/icons/mech.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/gals/icons/www.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width - 20,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.lightGreen,
            ),
            child: Column(children: const <Widget>[
              ListTile(
                title: Text(
                  '\nPlaceholder \n',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                  'sed do eiusmod tempor incididunt ut labore et dolore '
                  'magna aliqua. Ut enim ad minim veniam, quis nostrud'
                  ' exercitation ullamco laboris nisi ut aliquip ex ea '
                  'commodo consequat. Duis aute irure dolor in reprehenderit '
                  'in voluptate velit esse cillum dolore eu fugiat nulla '
                  'pariatur. Excepteur sint occaecat cupidatat non proident,'
                  ' sunt in culpa qui officia deserunt mollit anim id est '
                  'laborum.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width - 12,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                color: Colors.lightGreen,
              ),
              child: Column(children: const <Widget>[
                ListTile(
                  title: Text(
                    '\nPlaceholder \n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Text(
                    '"Sed ut perspiciatis unde omnis iste natus error sit '
                    'voluptatem accusantium doloremque laudantium, totam rem'
                    ' aperiam, eaque ipsa quae ab illo inventore veritatis '
                    'et quasi architecto beatae vitae dicta sunt explicabo. '
                    'Nemo enim ipsam voluptatem quia voluptas sit aspernatur '
                    'aut odit aut fugit, sed quia consequuntur magni dolores'
                    ' eos qui ratione voluptatem sequi nesciunt. Neque porro'
                    ' quisquam est, qui dolorem ipsum quia dolor sit amet,'
                    ' consectetur, adipisci velit, sed quia non numquam eius'
                    ' modi tempora incidunt ut labore et dolore magnam aliquam '
                    'quaerat voluptatem. Ut enim ad minima veniam, quis nostrum '
                    'exercitationem ullam corporis suscipit laboriosam, nisi '
                    'ut aliquid ex ea commodi consequatur? Quis autem vel eum'
                    ' iure reprehenderit qui in ea voluptate velit esse quam '
                    'nihil molestiae consequatur, vel illum qui dolorem eum'
                    ' fugiat quo voluptas nulla pariatur?"',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
