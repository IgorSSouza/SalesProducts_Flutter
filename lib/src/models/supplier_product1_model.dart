class Product {
  String id = "";
  String nome = "";
  String descricao = "";
  String categoria = "";
  String imagem = "";
  String preco = "";
  String material = "";
  String departamento = "";

  Product(this.id, this.nome, this.descricao, this.categoria, this.preco,
      this.imagem);

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    categoria = json['categoria'];
    preco = json['preco'];
    imagem = json['imagem'];
    material = json['material'];
    departamento = json['departamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['categoria'] = categoria;
    data['preco'] = preco;
    data['imagem'] = imagem;
    data['material'] = material;
    data['departamento'] = departamento;

    return data;
  }
}
