// main.dart
import 'package:flutter/material.dart';

import 'screen/progress_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Accueil'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Bienvenue sur l\'application météo',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 40.0),
//             Container(
//               width: 150.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/weather_icon.png'), // Ajoutez le chemin vers votre icône météo
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(75.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 10.0,
//                     spreadRadius: 5.0,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 40.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProgressScreen()),
//                 );
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 elevation: MaterialStateProperty.all<double>(5.0),
//                 padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                   EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//                 animationDuration: Duration(milliseconds: 300),
//               ),
//               child: AnimatedPadding(
//                 duration: Duration(milliseconds: 300),
//                 padding: EdgeInsets.all(8.0),
//                 curve: Curves.easeInOut,
//                 child: Text(
//                   'Commencer',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Accueil'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Bienvenue sur l\'application météo',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 40.0),
//             Container(
//               width: 120.0,
//               height: 120.0,
//               decoration: BoxDecoration(
//                 color: Colors.blue.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(60.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.blue.withOpacity(0.5),
//                     blurRadius: 10.0,
//                     spreadRadius: 5.0,
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 Icons.cloud,
//                 size: 60.0,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 40.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProgressScreen()),
//                 );
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                   EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                 ),
//               ),
//               child: Text(
//                 'Commencer',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blueAccent.shade100],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bienvenue sur l\'application météo de Bamba et ibra ',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(60.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.cloud,
                  size: 60.0,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgressScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreenAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  ),
                ),
                child: Text(
                  'Commencer',
                  style: TextStyle(fontSize: 20.0, color: Colors.blue.shade800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}