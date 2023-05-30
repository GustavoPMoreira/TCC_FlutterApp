import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desempenho',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GraphPage(),
    );
  }
}

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  String selectedOption = 'Individual';
  String selectedBranch = 'Filial 1';
  bool showSprintGraph = false;

  List<ChartData> data = [];

  @override
  void initState() {
    super.initState();
    // Gerar dados de exemplo para o gráfico
    generateChartData();
  }

  void generateChartData() {
    // Dados de exemplo
    data = [
      ChartData('01/01/2023', 50),
      ChartData('02/01/2023', 100),
      ChartData('03/01/2023', 75),
      ChartData('04/01/2023', 120),
      ChartData('05/01/2023', 90),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desempenho'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300.0,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData chartData, _) => chartData.date,
                  yValueMapper: (ChartData chartData, _) => chartData.score,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          DropdownButton<String>(
            value: selectedOption,
            hint: Text('Selecione uma opção'),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items:
                ['Individual', 'Time', 'Todos'].map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          SizedBox(height: 16.0),
          DropdownButton<String>(
            value: selectedBranch,
            hint: Text('Selecione uma filial'),
            onChanged: (String? newValue) {
              setState(() {
                selectedBranch = newValue!;
              });
            },
            items: ['Filial 1', 'Filial 2', 'Filial 3']
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          SizedBox(height: 16.0),
          CheckboxListTile(
            title: Text('Exibir gráfico por sprint'),
            value: showSprintGraph,
            onChanged: (bool? value) {
              setState(() {
                showSprintGraph = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String date;
  final int score;

  ChartData(this.date, this.score);
}
