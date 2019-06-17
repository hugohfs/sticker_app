import 'package:flutter/material.dart';
import 'package:sticker_app/globals/globals.dart' as g;
//import 'package:sticker_app/components/drawer.dart';
import 'package:sticker_app/models/user_info_details.dart';
import 'package:sticker_app/pages/panel.dart';
import 'package:sticker_app/pages/perfil.dart';
import 'package:sticker_app/pages/root_page.dart';
import 'package:sticker_app/pages/stickers.dart';
import 'package:sticker_app/services/authentication.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();

    if (g.userInfoDetails != null) {
      print('userInfoDetails.email:' + g.userInfoDetails.email);
    } else {
      _checkEmailVerification();

      widget.auth.getCurrentUser().then((user) {
        setState(() {
          if (user != null) {
            g.userInfoDetails = new UserInfoDetails(user?.providerId,
                user?.displayName, user?.email, user?.photoUrl, user?.uid);
          }
        });
      });
    }
  }

  void _checkEmailVerification() async {
    g.isEmailVerified = await widget.auth.isEmailVerified();
    if (!g.isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _signOut() async {
    try {
      await widget.auth.signOutGoogle();
      await widget.auth.signOut();
      widget.onSignedOut();
      } catch (e) {
      print(e);
    }
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RootPage(auth: new Auth())));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _showCurrentTab(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return PanelPage();
        break;
      case 1:
        return StickersPage();
        break;
      case 2:
        return PerfilPage();
        break;
      default:
        return Text("Index tab not defined");
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(g.APPBAR_MENU_PRINCIPAL),
          actions: <Widget>[
            IconButton(
              //icon: Icon((Icons.power_settings_new)), onPressed: () => widget.auth.disconnect()),
                icon: Icon((Icons.exit_to_app)),
                onPressed: _signOut),
          ],
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


    /*return Scaffold(
      appBar: AppBar(
        title: Text(g.APPBAR_MENU_PRINCIPAL),
        actions: <Widget>[
          IconButton(
              //icon: Icon((Icons.power_settings_new)), onPressed: () => widget.auth.disconnect()),
              icon: Icon((Icons.exit_to_app)),
              onPressed: _signOut),
        ],
      ),
      /*drawer: new MyDrawer(
          auth: widget.auth,
          userId: widget.userId,
          onSignedOut: widget.onSignedOut),*/
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(children: <Widget>[
                _showLogo(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                    child: new Center(
                        child: Text(
                            "Bienvenido: " + g.userInfoDetails.displayName,
                            style: new TextStyle(fontSize: 22.0)))),
              ]),
            )
          ],
        ),
      ),
    );*/
  }
}
