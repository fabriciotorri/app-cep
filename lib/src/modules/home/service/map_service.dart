import 'package:dio/dio.dart';

class MapService {
  final Dio dio = Dio(BaseOptions(headers: {'User-Agent': 'app_cep_flutter'}));

  Future<Map<String, double>?> buscarCoordenadas(String endereco) async {
    try {
      final response = await dio.get(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {'q': endereco, 'format': 'json', 'limit': 1},
      );

      print('RESPOSTA MAP: ${response.data}'); // 🔍 debug

      if (response.data != null && response.data.isNotEmpty) {
        final data = response.data[0];

        return {
          'lat': double.parse(data['lat']),
          'lon': double.parse(data['lon']),
        };
      }
    } catch (e) {
      print('Erro ao buscar coordenadas: $e');
    }

    return null;
  }
}
