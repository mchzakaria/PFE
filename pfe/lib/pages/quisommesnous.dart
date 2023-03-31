import 'package:pfe/widget/widgets.dart';

class QuiS extends StatefulWidget {
  const QuiS({Key? key}) : super(key: key);
  @override
  State<QuiS> createState() => _QuiSState();
}

class _QuiSState extends State<QuiS> {
  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> images = [
    "assets/images/logo.png",
    "assets/images/job.png",
    "assets/images/person.jpg",
    "assets/images/stage.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "I Search",
            style: TextStyle(color: Color.fromARGB(255, 96, 96, 96)),
          ),
          centerTitle: true,
          leading: Image.asset("assets/images/clogo.png"),
        ),
        body: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.all(10),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index % images.length;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Image.network(
                            images[index % images.length],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < images.length; i++)
                      buildIndicator(currentIndex == i)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Container(
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.only(left: 95),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 233, 148, 248)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(2.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Votre Nom ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.only(right: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 241, 163, 189)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(2.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'I SEARCH?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.only(left: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 233, 148, 248)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(2.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Vos Qualités ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 120,
                  margin: const EdgeInsets.only(right: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 241, 163, 189)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(2.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Facilité\n'
                    'Recherche avancée\n'
                    'Profil utilisateur\n '
                    'Feedback',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 80,
                  margin: const EdgeInsets.only(left: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 233, 148, 248)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(2.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Quel est l\'objectif de ISEARCH?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 180,
                  margin: const EdgeInsets.only(right: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 241, 163, 189)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(2.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'L’objectif de ISEARCH est de simplifier la mise en relation des professionnels dans le but de se constituer un réseau et de l’élargir. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 100,
                  margin: const EdgeInsets.only(left: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 233, 148, 248)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(2.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Quelles sont les opportunités de ISEARCH?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 180,
                  margin: const EdgeInsets.only(right: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 233, 137, 169)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(2.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'ISEARCH vous permet de rentrer facilement en contact avec les différents acteurs qui gravitent dans votre secteur d’activité.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 80,
                  margin: const EdgeInsets.only(left: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 234, 164, 246)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(2.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Et pour les entrepreneurs ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 270,
                  margin: const EdgeInsets.only(right: 80),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color.fromARGB(255, 241, 163, 189)),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(2.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'ISEARCH conçu aussi pour aider les professionnels et entrepreneurs à élargir leur réseau professionnel, à trouver de nouvelles opportunités ou à développer leur image de marque.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
