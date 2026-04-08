import '../repositories/cep_repository.dart';
import '../model/cep_model.dart';

class CepService {
  final CepRepository repository;

  CepService(this.repository);

  Future<CepModel> buscarCep(String cep) async {
    if (cep.isEmpty) {
      throw Exception('CEP inválido');
    }

    return await repository.buscarCep(cep);
  }
}
