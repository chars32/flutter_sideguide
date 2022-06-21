void main() {
  // Final - runtime constant
  // value can be assigned or moddified at runtime
  final List<int> valor = [1, 2, 3, 4];
  print(valor);
  valor.add(5);
  print(valor);

  // Conts - compile-timeconstant
  // at compile time the variable is frozen
  // cant assign or moddified
  const valor_dos = [1,2,3];
  print(valor_dos);
  valor_dos.add(4); // this send an error "Unhandled exception"
  print(valor_dos);
}
