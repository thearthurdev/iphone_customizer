import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:iphone_customizer/customIcons/brand_icons_icons.dart';

void main() => runApp(IphoneCustomizer());

class IphoneCustomizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // We set 3 variables of the type color for the 3 parts of the phone.
  Color _backPanelColor = Colors.white;
  Color _cameraBumpColor = Colors.white;
  Color _logoColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    // We create the camera widget separately so that it can be used multiple times.
    // You can also use an image of a camera lense to make things simpler.
    // Here we simply keep stacking circles until it looks like a camera lense.
    Widget camera = Container(
      width: 35.0,
      height: 35.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[700],
            ),
          ),
          Container(
            width: 3.0,
            height: 3.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );

    // The camera bump widget is also created separately.
    // The camera widgets are positioned relative to the camera bump so that
    // if we were to move the camera bump itself the camera positions would move with it
    // rather than stick to the back panel.
    Widget cameraBump = Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _cameraBumpColor,
          boxShadow: [
            BoxShadow(
              // color.computeLuminance is a handy way to get the deepness of a color
              // in order to adjust the color of another widget for legibility or visibility.
              // It returns a value between 0.0 and 0.1 so you can pick any double within that range.
              // Here we simply use it to deepen the shadow of the camera bump when the color
              // of the back panel gets deeper.
              color: _backPanelColor.computeLuminance() > 0.335
                  ? Colors.black12
                  : Colors.black38,
              spreadRadius: 1.0,
              blurRadius: 3.0,
            )
          ]),
      child: Stack(
        children: <Widget>[
          // This container uses a gradient to give the camera bump a glossy look.
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [
                  // First color is transparent to show the camera bump's true color.
                  // Second color is a transluscent black to slightly shade the color.
                  Colors.transparent,
                  _cameraBumpColor.computeLuminance() > 0.335
                      ? Colors.black.withOpacity(0.05)
                      : Colors.black.withOpacity(0.15),
                ],
                stops: [0.2, 0.2],
                begin: FractionalOffset(0.5, 0.3),
                end: FractionalOffset(0.0, 0.5),
              ),
            ),
          ),
          Positioned(
            left: 3.0,
            top: 3.0,
            child: camera,
          ),
          Positioned(
            left: 3.0,
            bottom: 3.0,
            child: camera,
          ),
          Positioned(
            right: 3.0,
            top: 22.5,
            child: camera,
          ),
          //Flash
          Positioned(
            right: 12.0,
            top: 4.0,
            child: Container(
              width: 15.0,
              height: 15.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow[200],
                border: Border.all(
                  color: Colors.grey[200],
                  width: 3.0,
                ),
              ),
            ),
          ),
          //Microphone
          Positioned(
            right: 17.0,
            bottom: 9.0,
            child: Container(
              width: 6.0,
              height: 6.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('iPhone 11 Pro Max'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              // This is the back panel of the iPhone.
              // Again the camera bump and Apple logo are positioned relative to the back panel.
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 250.0,
                height: 500.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: _backPanelColor,
                    border: Border.all(
                      color: _backPanelColor,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(5, 5),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                      )
                    ]),
                child: Stack(
                  children: <Widget>[
                    // This container uses a gradient to give the back panel a matte look.
                    Container(
                        width: 250.0,
                        height: 500.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            colors: [
                              // First color is transparent to show the back panel's true color.
                              // Second color is a transluscent black to slightly shade the color.
                              Colors.transparent,
                              _backPanelColor.computeLuminance() > 0.335
                                  ? Colors.black12
                                  : Colors.black26
                            ],
                            // Notice that here there are no stops so the gradient is smooth.
                            begin: FractionalOffset(0.5, 0.0),
                            end: FractionalOffset(0.0, 0.5),
                          ),
                        )),
                    Positioned(
                      top: 5.0,
                      left: 5.0,
                      child: cameraBump,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        // In order to be able to change the color of the Apple logo, we created a custom icon
                        // and imported it into the project.
                        // see the link below on how to do that.
                        // https://medium.com/flutterpub/how-to-use-custom-icons-in-flutter-834a079d977
                        BrandIcons.apple,
                        color: _logoColor,
                        size: 60.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // This section is for the color picker buttons.
            Flexible(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text('Back Panel Color'),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _backPanelColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(5, 5),
                              spreadRadius: 2.0,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Stack(children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                _backPanelColor.computeLuminance() > 0.335
                                    ? Colors.black12
                                    : Colors.white12,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.0],
                              begin: FractionalOffset(0.0, -0.5),
                              end: FractionalOffset(-0.5, 0.0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    // In the onTap function we'll call the selectColor function with
                    // two parameters, the side of the phone who's color we want to change
                    // and the current color of that side.
                    onTap: () => selectColor('Back', _backPanelColor),
                  ),
                  SizedBox(height: 16.0),
                  Text('Camera Bump Color'),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _cameraBumpColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(5, 5),
                              spreadRadius: 2.0,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Stack(children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                _cameraBumpColor.computeLuminance() > 0.335
                                    ? Colors.black12
                                    : Colors.white12,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.0],
                              begin: FractionalOffset(0.0, -0.5),
                              end: FractionalOffset(-0.5, 0.0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    onTap: () => selectColor('Bump', _cameraBumpColor),
                  ),
                  SizedBox(height: 16.0),
                  Text('Apple Logo Color'),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _logoColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(5, 5),
                              spreadRadius: 2.0,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Stack(children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                _logoColor.computeLuminance() > 0.335
                                    ? Colors.black12
                                    : Colors.white12,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.0],
                              begin: FractionalOffset(0.0, -0.5),
                              end: FractionalOffset(-0.5, 0.0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    onTap: () => selectColor('Logo', _logoColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // We use a package called flutter_material_color_picker to pick a color.
  // Based on the parameters passed on from the onTap functions the desired
  // side part of the phone will change to the selected color.
  void selectColor(String side, Color _selectedColor) {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Pick a color'),
        children: <Widget>[
          MaterialColorPicker(
            // Since we are using the same function for multiple buttons we tell it to
            // only change the color of a specific part of the phone by checking these if statements
            // with the first parameter passed on from the onTap function.
            onColorChange: (Color color) {
              if (side == 'Back') {
                _backPanelColor = color;
              }
              if (side == 'Bump') {
                _cameraBumpColor = color;
              }
              if (side == 'Logo') {
                _logoColor = color;
              }
            },
            // The second parameter is used to tell the color picker which color is currently selected.
            selectedColor: _selectedColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text('Select'),
                onPressed: () async {
                  // We finally call setState(() {}) to see the color changes we made reflect on the ui.
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
