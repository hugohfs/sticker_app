import 'package:flutter/material.dart';
import 'package:sticker_app/globals/globals.dart' as g;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
as font_awesome_flutter;
import 'package:sticker_app/pages/panel.dart';


void main() => runApp(MyApp());
//void main() => runApp(MyAppLista());

class MyAppLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 200.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.purple,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sticker App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  /*static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Panel',
      style: optionStyle,
    ),
    Text(
      'Index 1: Stickers',
      style: optionStyle,
    ),
    Text(
      'Index 2: Perfil',
      style: optionStyle,
    ),
  ];*/

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _showCurrentTab(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return OpenFoodFactsPage();
        //return _showHomeBody();
        break;
      case 1:
        return Text(
            'Index 1: Stickers',
            style: optionStyle,
        );
        //return StartupNameGenerator();
        break;
      case 2:
        return Text(
          'Index 2: Perfil',
          style: optionStyle,
        );
        //return ChatScreen();
        break;
      default:
        return Text("Index tab not defined");
        break;
    }
  }

  Container _showHomeBody() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50.0),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 100.0,
            color: Colors.purple,
          ),
          Container(
            width: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            color: Colors.green,
          ),
          Container(
            width: 100.0,
            color: Colors.yellow,
          ),
          Container(
            width: 100.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticker App'),
      ),
      body: Center(child: _showCurrentTab(_selectedIndex)
        //child: _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(g.tabPanelName),
                backgroundColor: Theme.of(context).accentColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text(g.tabStickersName),
                backgroundColor: Theme.of(context).accentColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text(g.tabPerfilName),
                backgroundColor: Theme.of(context).accentColor),
          ],
          currentIndex: _selectedIndex,
          //fixedColor: Colors.deepPurple,
          onTap: _onItemTapped,
        )
    );
  }
}
