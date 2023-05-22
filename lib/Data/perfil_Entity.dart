import 'dart:html';

class PerfilEntity{
  late int? perfilID;
  final String? nome;
  final String email;
  final String senha;
  final Blob? foto;

  PerfilEntity({
    this.nome,
    required this.email,
    required this.senha,
    this.foto,
  });
}
