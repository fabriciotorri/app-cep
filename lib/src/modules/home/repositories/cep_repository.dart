import 'package:dio/dio.dart';
import '../../../http/dio_client.dart';
import '../model/cep_model.dart';

class CepRepository {
  final Dio dio = DioClient.dio;

  Future<CepModel> buscarCep(String cep) async {
    try {
      final response = await dio.get('/ws/$cep/json/');

      print('STATUS: ${response.statusCode}');
      print('DATA: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data['erro'] == true) {
          throw Exception('CEP não encontrado');
        }

        return CepModel.fromJson(response.data);
      } else {
        throw Exception('Erro ao buscar CEP');
      }
    } catch (e) {
      print('ERRO REAL: $e');
      throw Exception('Erro ao buscar CEP: $e');
    }
  }
}
