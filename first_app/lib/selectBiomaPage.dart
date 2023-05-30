import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selecionar Bioma',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SelectBiomePage(),
    );
  }
}

class SelectBiomePage extends StatefulWidget {
  @override
  _SelectBiomePageState createState() => _SelectBiomePageState();
}

class _SelectBiomePageState extends State<SelectBiomePage> {
  String? selectedBiome;
  String? selectedSpecies;

  Map<String, List<String>> biomeSpecies = {
    'Amazônia': ['Açaí', 'Castanheira', 'Cupuaçu', 'Pau-rosa', 'Seringueira'],
    'Cerrado': ['Pequi', 'Ipê', 'Jatobá', 'Buriti', 'Cagaita'],
    'Mata Atlântica': [
      'Pau-brasil',
      'Cedro',
      'Jacarandá',
      'Palmito-juçara',
      'Ipê-roxo'
    ],
    'Pantanal': ['Manduvi', 'Ipê-amarelo', 'Aroeira', 'Carandá', 'Cambará'],
    'Caatinga': ['Juazeiro', 'Angico', 'Mandacaru', 'Carnaúba', 'Oiticica'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Bioma'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Selecione um Bioma',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: selectedBiome,
                hint: Text('Selecione um bioma'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBiome = newValue;
                    selectedSpecies =
                        null; // Limpa a espécie selecionada ao mudar o bioma
                  });
                },
                items: biomeSpecies.keys.map<DropdownMenuItem<String>>(
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
                'Selecione uma espécie nativa',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                children: (biomeSpecies[selectedBiome] ?? []).map<Widget>(
                  (String speciesName) {
                    return ListTile(
                      leading: Radio(
                        value: speciesName,
                        groupValue: selectedSpecies,
                        onChanged: (String? value) {
                          setState(() {
                            selectedSpecies = value;
                          });
                        },
                      ),
                      title: Text(speciesName),
                      onTap: () {
                        setState(() {
                          selectedSpecies = speciesName;
                        });
                      },
                      selected: selectedSpecies == speciesName,
                      tileColor: selectedSpecies == speciesName
                          ? Colors.green.withOpacity(0.5)
                          : null,
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para confirmar a seleção
                  if (selectedBiome != null && selectedSpecies != null) {
                    print('Bioma selecionado: $selectedBiome');
                    print('Espécie selecionada: $selectedSpecies');
                  }
                },
                child: Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
