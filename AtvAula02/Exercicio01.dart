/*
ATIVIDADE 1. Crie um programa em Dart para um sistema de cadastro de equipamentos do
IFSP. Use `var` para declarar o nome do equipamento como "Impressora 3D", `String`
para o local como "Lab de Protótipos", e `dynamic` para o número de patrimônio,
inicialmente como `12345`. Em seguida, altere o valor de `patrimonio` para `"12345-A"`
(simulando uma mudança de formato). Por fim, imprima os valores e use o operador `is`
para mostrar o tipo atual de cada variável. Use comentários no código para explicar por que
Dart permite mudar o tipo de patrimonio, mas não de local.
*/

void main() {
    var equipamento = "Impressora 3D";
    String local = "Lab de Protótipos";
    dynamic patrimonio = 12345;

    patrimonio = "12345-A";

    // Imprimindo os valores
    print("Equipamento: $equipamento");
    print("Local: $local");
    print("Patrimônio: $patrimonio");

    // Verificando o tipo atual de cada variável
    print("\nVerificação de tipos:");
    print("equipamento é String? ${equipamento is String}");    //True
    print("local é String? ${local is String}");                //True
    print("patrimonio é String? ${patrimonio is String}");      //True
    print("patrimonio é int? ${patrimonio is int}");            //False

    /*
    Explicação:

    - A variável 'patrimonio' foi declarada como dynamic, então ela pode receber valores de qualquer tipo.

    - A variável 'local' foi declarada como String, então só pode armazenar valores do tipo String.
    */
}