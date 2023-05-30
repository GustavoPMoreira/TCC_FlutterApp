import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doação para ONG',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DonationPage(),
    );
  }
}

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String? selectedOng;
  String? selectedPayment;
  double donationAmount = 0.0;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  List<String> ongs = [
    'ONG 1',
    'ONG 2',
    'ONG 3',
    'ONG 4',
    'ONG 5',
  ];

  List<String> paymentMethods = [
    'Débito',
    'Crédito',
    'Pix',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doação para ONG'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: selectedOng,
                hint: Text('Selecione uma ONG'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOng = newValue;
                  });
                },
                items: ongs.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 16.0),
              Text(
                'Valor da Doação',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                currencyFormat.format(donationAmount),
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    donationAmount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: selectedPayment,
                hint: Text('Selecione uma forma de pagamento'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPayment = newValue;
                  });
                },
                items: paymentMethods.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para confirmar a doação
                  if (selectedOng != null &&
                      donationAmount > 0 &&
                      selectedPayment != null) {
                    final formattedAmount =
                        currencyFormat.format(donationAmount);
                    print('ONG selecionada: $selectedOng');
                    print('Valor da doação: $formattedAmount');
                    print('Forma de pagamento: $selectedPayment');
                  }
                },
                child: Text('Confirmar Doação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
