import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int points = 0;
  int maxPoints = 400;
  TextEditingController _pointsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _addPoints() {
    setState(() {
      int inputPoints = int.tryParse(_pointsController.text) ?? 0;
      points += inputPoints;
      if (points > maxPoints) {
        points = maxPoints;
      }
      _pointsController.clear();
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = points / maxPoints;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pontuação: $points',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                // Alterado para Widget? child
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: CircularProgressIndicator(
                        value: _animationController.value * progress,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        backgroundColor: Colors.grey[300],
                        strokeWidth: 10.0,
                      ),
                    ),
                    Text(
                      '${(_animationController.value * points).toInt()}',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _pointsController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: 'Pontuação',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Adicionar Pontos'),
              onPressed: _addPoints,
            ),
          ],
        ),
      ),
    );
  }
}
