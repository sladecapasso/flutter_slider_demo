import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(SliderDemo());

class SliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Slider Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              _DemoLink(
                text:'Basic Slider 1 [Right]',
                demo: Slider1(),
              ),
              _DemoLink(
                text: 'Basic Slider 2 [Left]',
                demo: Slider2(),
              ),
              _FigmaLink(
                text: 'Basic Slider 3 [Error]',
                urlLaunch: 'https://www.figma.com/proto/gOBx7XCSgdeiNzpoCwjmyz/Slider-Text-Field-Prototype?node-id=31%3A2&viewport=-481%2C7101%2C1.0553679466247559&scaling=contain',
              ),
              _DemoLink(
                text: 'Discrete Slider 1 [Rounding]',
                demo: DiscreteSlider1(),
              ),
              _FigmaLink(
                text: 'Discrete Slider 2 [Error - Figma]',
                urlLaunch: 'https://www.figma.com/proto/gOBx7XCSgdeiNzpoCwjmyz/Slider-Text-Field-Prototype?node-id=59%3A5&viewport=466%2C556%2C0.125&scaling=contain',
              ),
              _DemoLink(
                text: 'Range Slider 1',
                demo: RangeSlider1(),
              ),
              _FigmaLink(
                text: 'Range Slider 2 [Error]',
                urlLaunch: 'https://www.figma.com/proto/gOBx7XCSgdeiNzpoCwjmyz/Slider-Text-Field-Prototype?node-id=36%3A260&viewport=1247%2C629%2C0.21958981454372406&scaling=contain',
              ),
              _FigmaLink(
                text: 'Basic Slider 4 [Large]',
                urlLaunch: 'https://www.figma.com/proto/gOBx7XCSgdeiNzpoCwjmyz/Slider-Text-Field-Prototype?node-id=42%3A0&viewport=-139%2C536%2C0.5821874737739563&scaling=contain',
              ),
              _FigmaLink(
                text: 'Basic Slider 5 [Chunking]',
                urlLaunch: 'https://www.figma.com/proto/gOBx7XCSgdeiNzpoCwjmyz/Slider-Text-Field-Prototype?node-id=51%3A421&viewport=496%2C432%2C0.107962965965271&scaling=contain',
              ),
              _DemoLink(
                text: 'Basic Slider 6 [Delay]',
                demo: Slider6(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Each demo is a stateful widget so that the value can be updated.

class Slider1 extends StatefulWidget {
  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  double _continuousValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Slider 1 [Right]'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Slider(
                  min: 0.0,
                  max: 100.0,
                  value: _continuousValue,
                  onChanged: (double value) {
                    setState(() {
                      _continuousValue = value;
                    });
                  },
                ),
              ),
              SizedBox(
                child: SliderTextField(
                    onChanged: (double value){
                    setState(() {
                      _continuousValue = value;
                    });
                    print('New value: $value');
                  },
                  value: _continuousValue.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Slider2 extends StatefulWidget {
  @override
  _Slider2State createState() => _Slider2State();
}

class _Slider2State extends State<Slider2> {
  double _continuousValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Slider 2 [Left]'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                child: SliderTextField(
                  onChanged: (double value){
                    setState(() {
                      _continuousValue = value;
                    });
                    print('New value: $value');
                  },
                  value: _continuousValue.toString(),
                ),
              ),
              Expanded(
                child: Slider(
                  min: 0.0,
                  max: 100.0,
                  value: _continuousValue,
                  onChanged: (double value) {
                    setState(() {
                      _continuousValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscreteSlider1 extends StatefulWidget {
  @override
  _DiscreteSlider1State createState() => _DiscreteSlider1State();
}

class _DiscreteSlider1State extends State<DiscreteSlider1> {
  double _continuousValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discrete Slider 1 [Rounding]'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTickMarkColor: Colors.blue[900],
                      inactiveTickMarkColor: Colors.blue[800],
                    ),
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      value: _continuousValue,
                      divisions: 5,
                      onChanged: (double value) {
                        setState(() {
                          _continuousValue = value;
                        });
                      },
                    ),
                ),
              ),
              SizedBox(
                child: SliderTextField(
                  onChanged: (double value){
                    setState(() {
                      _continuousValue = (value/20).roundToDouble()*20;
                    });
                    print('New value: $value');
                  },
                  value: _continuousValue.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RangeSlider1 extends StatefulWidget {
  @override
  _RangeSlider1State createState() => _RangeSlider1State();
}

class _RangeSlider1State extends State<RangeSlider1> {
  RangeValues _values = RangeValues(25, 75);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Range Slider 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Row(
              children: <Widget>[
                SizedBox(
                  child: SliderTextField(
                    onChanged: (double value){
                      setState(() {
                        if (value > _values.end){
                          return;//value = _values.end;
                        }
                          _values = RangeValues(value, _values.end);
                      });
                      print('New value: $value');
                    },
                    value: _values.start.toString(),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Empty';
                      }else if(double.tryParse(value) == null || double.tryParse(value) > _values.end ){
                        return 'Error';
                      } else {
                        return null;
                      }
                    },
                    autovalidate: true,
                  ),
                ),
                Expanded(
                  child: RangeSlider(
                    min: 0,
                    max: 100,
                    values: _values,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _values = values;
                      });
                    },
                  ),
                ),
                SizedBox(
                  child: SliderTextField(
                    onChanged: (double value){
                      setState(() {
                        _values = RangeValues(_values.start, value);
                      });
                      print('New value: $value');
                    },
                    value: _values.end.toString(),
                    validator: (value) {
                      if (value.isEmpty) {
                        return null;
                      }else if(double.tryParse(value) == null || double.tryParse(value) < _values.start){
                        return 'Error';
                      }else {
                        return null;
                      }
                    },
                    autovalidate: true,
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

class Slider6 extends StatefulWidget {
  @override
  _Slider6State createState() => _Slider6State();
}

class _Slider6State extends State<Slider6> {
  double _continuousValue1= 0;
  double _continuousValue2= 10;
  double _continuousValue3= 20;
  double _continuousValue4= 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Slider 6 [Delay]'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: _continuousValue1,
                    onChanged: (double value) {
                      setState(() {
                        _continuousValue1 = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  child: SliderTextField(
                    onChanged: (double value){
                      setState(() {
                        _continuousValue1 = value;
                      });
                      print('New value: $value');
                    },
                    value: _continuousValue1.toString(),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: _continuousValue2,
                    onChanged: (double value) {
                      setState(() {
                        _continuousValue2 = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  child: SliderTextField(
                    textChangeTimeout: const Duration(seconds:4),
                    onChanged: (double value){
                      setState(() {
                        _continuousValue2 = value;
                      });
                      print('New value: $value');
                    },
                    value: _continuousValue2.toString(),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: _continuousValue3,
                    onChanged: (double value) {
                      setState(() {
                        _continuousValue3 = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  child: SliderTextField(
                    textChangeTimeout: const Duration(seconds:8),
                    onChanged: (double value){
                      setState(() {
                        _continuousValue3 = value;
                      });
                      print('New value: $value');
                    },
                    value: _continuousValue3.toString(),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: _continuousValue4,
                    onChanged: (double value) {
                      setState(() {
                        _continuousValue4 = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  child: SliderTextField(
                    textChangeTimeout: const Duration(seconds:10),
                    onChanged: (double value){
                      setState(() {
                        _continuousValue4 = value;
                      });
                      print('New value: $value');
                    },
                    value: _continuousValue4.toString(),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

// Private class to assist with adding demos on main page.

class _DemoLink extends StatelessWidget {
  _DemoLink({
    this.text,
    this.demo,
  });

  final String text;
  final Widget demo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ButtonTheme(
        height: 48,
        buttonColor: Colors.blue[500],
        textTheme: ButtonTextTheme.primary,
        child: RaisedButton(
          child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(text, textAlign: TextAlign.left,),
                )]
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => demo));
          },
        ),
      ),
    );
  }
}

// Private class to assist with adding links on main page.

class _FigmaLink extends StatelessWidget {
  _FigmaLink({
    this.text,
    this.urlLaunch,
  });

  final String text;
  final String urlLaunch;

  _launchFigmaLink() async {
    var url = urlLaunch;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ButtonTheme(
        height: 48,
        buttonColor: Colors.blue[500],
        textTheme: ButtonTextTheme.primary,
        child: RaisedButton(
          child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(text,
                    textAlign: TextAlign.left,),
                ),
                Image.asset('assets/images/figma_logo.png', height: 50, width: 50,),
              ]
          ),
          onPressed: _launchFigmaLink,
        ),
      ),
    );
  }
}