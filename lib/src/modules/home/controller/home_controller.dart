import 'package:app_cep/src/modules/home/repositories/cep_repository.dart';
import 'package:mobx/mobx.dart';
import '../service/cep_service.dart';
import 'package:hive/hive.dart';
import '../service/map_service.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

Future<void> abrirMapa(double lat, double lon) async {
  final url = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$lat,$lon',
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Não foi possível abrir o mapa';
  }
}

abstract class _HomeControllerBase with Store {
  final CepService service = CepService(CepRepository());

  final MapService mapService = MapService();

  @observable
  double? lat;

  @observable
  double? lon;

  @observable
  String cep = '';

  @observable
  String resultado = '';

  @observable
  bool loading = false;

  @observable
  String erro = '';

  bool cepValido(String cep) {
    final regex = RegExp(r'^\d{5}-?\d{3}$');
    return regex.hasMatch(cep);
  }

  @action
  Future<void> buscarCep() async {
    if (loading) return;

    //
    if (!cepValido(cep)) {
      erro = 'Digite um CEP válido com 8 números';
      return;
    }

    loading = true;
    erro = '';
    resultado = '';

    try {
      final cepLimpo = cep.replaceAll('-', '');

      final data = await service.buscarCep(cepLimpo);

      if (data.logradouro.isEmpty) {
        erro = 'CEP não encontrado';
        loading = false;
        return;
      }

      resultado =
          'Rua: ${data.logradouro}\nCidade: ${data.localidade}\nUF: ${data.uf}';

      final enderecoCompleto =
          '${data.logradouro}, ${data.localidade}, ${data.uf}';

      final coordenadas = await mapService.buscarCoordenadas(enderecoCompleto);

      if (coordenadas != null) {
        lat = coordenadas['lat'];
        lon = coordenadas['lon'];

        resultado += '\nLat: $lat \nLon: $lon';
      }

      final box = Hive.box('ceps');
      box.add(resultado);
    } catch (e) {
      erro = 'Erro ao buscar CEP';
    }

    loading = false;
  }

  Future<void> abrirMapa() async {
    if (lat == null || lon == null) return;

    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lon',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Não foi possivel abrir o mapa';
    }
  }
}
