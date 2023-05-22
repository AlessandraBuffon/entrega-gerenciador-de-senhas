import 'dart:html';

class CartoesEntity {
  late int? id;
  late final String? descricao;
  late final String? numero;
  late final String? validade;
  late final String? cvv;
  late final String? senha;

  CartoesEntity({
    this.descricao,
    this.numero,
    this.validade,
    this.cvv,
    this.senha,
  });
}
