/*
ATIVIDADE 4. Utilizando a classe Laptop do exercício anterior, crie 3 named
constructors. Cada um deve criar uma instância de Laptop que configure:
• um laptop para somente navegação na internet;
• um laptop para uso em escritório;
• um laptop para programação.
Você deve decidir quais configurações serão definidas em cada named
constructor. Por fim, crie instâncias de objetos Laptop utilizando cada um dos
named constructor e imprima seus valores no console.
*/

class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  Laptop.navegacao(this.id, this.nome)
    : ram = 8,
      clockCpu = 3.0;

  Laptop.escritorio(this.id, this.nome)
    : ram = 16,
      clockCpu = 3.5;

  Laptop.programacao(this.id, this.nome)
    : ram = 32,
      clockCpu = 4.0;

  void mostrarDetalhes() {
    print("Id: $id");
    print("Nome: $nome");
    print("Ram: $ram GB");
    print("Clock Cpu: $clockCpu GHz\n");
  }
}

void main() {
  Laptop laptop1 = new Laptop(1, "Laptop normal", 16, 3.8);
  Laptop laptop2 = new Laptop.navegacao(2, "Laptop para internet");
  Laptop laptop3 = new Laptop.escritorio(3, "Laptop para escritório");
  Laptop laptop4 = new Laptop.programacao(4, "Laptop para programação");

  laptop1.mostrarDetalhes();
  laptop2.mostrarDetalhes();
  laptop3.mostrarDetalhes();
  laptop4.mostrarDetalhes();
}