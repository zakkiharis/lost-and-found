import 'package:flutter_app_bloc/data/model/model_kehilangan.dart';
import 'package:flutter_app_bloc/data/repository/kehilangan_repository.dart';

class KehilanganDomain {
  final KehilanganRepository kehilanganRepository;

  KehilanganDomain(this.kehilanganRepository);

  Future<List<Kehilangan>> getKehilangan() {
    return kehilanganRepository.getKehilangan();
  }
}
