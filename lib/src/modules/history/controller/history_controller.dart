import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  @observable
  ObservableList<String> ceps = ObservableList<String>();

  @action
  void carregarHistorico() {
    final box = Hive.box('ceps');

    ceps.clear();
    ceps.addAll(box.values.cast<String>());
  }
}
