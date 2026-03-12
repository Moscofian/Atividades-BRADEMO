/*
ATIVIDADE 5. Escreva um programa de cadastro de residências em um portal
de vendas em Dart. Para tal, siga as instruções a seguir:
• Crie uma classe House com as propriedades int id, String name e double
price;
• Implemente um construtor que utilize o this para inicializar os atributos.
• Solicite ao usuário que digite os dados (id, name e price) de 3 casas;
• Crie os objetos da classe com os dados informados e adicione-os a uma
lista;
• Após a criação, use cascade notation (..) para alterar o nome de cada
casa, adicionando o sufixo "(Cadastrada)".
• Use um for-in para imprimir todos os detalhes das casas cadastradas.
Dica: Use stdin.readLineSync() e lembre-se de converter os dados com
int.parse() e double.parse()
*/

import 'dart:io';

class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);

  void mostrarDetalhes() {
    print("Id: $id");
    print("Name: $name");
    print("Price: $price\n");
  }
}

void main() {
  List<House> casas = [];

  for (int i = 0; i < 3; i++) {
    print("\nCadastro da casa ${i + 1}");

    stdout.write("ID: "); // stdout é para que o input fique na mesma linha que o texto
    int id = int.parse(stdin.readLineSync()!);

    stdout.write("Nome: ");
    String name = stdin.readLineSync()!;

    stdout.write("Preço: ");
    double price = double.parse(stdin.readLineSync()!);

    House casa = House(id, name, price)
      ..name = "$name (Cadastrada)";

    casas.add(casa);
  }

  print("\nCasas cadastradas:");

  for (var casa in casas) {
    casa.mostrarDetalhes();
  }
}