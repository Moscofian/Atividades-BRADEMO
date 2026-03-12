/*
ATIVIDADE 3. Escreva um programa em Dart para criar uma classe Laptop
com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
imprimindo todos os detalhes.
*/

class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  void mostrarDetalhes() {
    print("Id: $id");
    print("Nome: $nome");
    print("Ram: $ram GB");
    print("Clock Cpu: $clockCpu GHz\n");
  }
}

void main() {
  Laptop laptop1 = new Laptop(1, "Laptop01", 16, 3.5);
  Laptop laptop2 = new Laptop(2, "Laptop02", 8, 3.0);
  var laptop3 = new Laptop(3, "Laptop03", 32, 3.8); // Var atribui o tipo Laptop automaticamente

  laptop1.mostrarDetalhes();
  laptop2.mostrarDetalhes();
  laptop3.mostrarDetalhes();
}