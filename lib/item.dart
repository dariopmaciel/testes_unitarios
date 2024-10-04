// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  String nome;
  double preco;
  
  Item({
    required this.nome,
    required this.preco,
  });


  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.nome == nome &&
      other.preco == preco;
  }

  @override
  int get hashCode => nome.hashCode ^ preco.hashCode;
}
