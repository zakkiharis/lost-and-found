import 'package:flutter_app_bloc/bloc/kehilangan_bloc/kehilangan_event.dart';
import 'package:flutter_app_bloc/bloc/kehilangan_bloc/kehilangan_state.dart';
import 'package:flutter_app_bloc/data/domain/kehilangan_domain.dart';
import 'package:flutter_app_bloc/data/model/model_kehilangan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'kehilangan_event.dart';
import 'kehilangan_state.dart';

class KehilanganBloc extends Bloc<KehilanganEvent, KehilanganState> {
  KehilanganDomain kehilanganDomain;

  KehilanganBloc({@required this.kehilanganDomain})
      : assert(kehilanganDomain != null),
        super(null);

  KehilanganState get initialState => KehilanganFetchLoading();

  @override
  Stream<KehilanganState> mapEventToState(KehilanganEvent event) async* {
    if (event is KehilanganFetching) {
      yield KehilanganFetchLoading();
      try {
        List<Kehilangan> kehilangan = await kehilanganDomain.getKehilangan();
        yield KehilanganFetchSuccess(kehilangan: kehilangan);
      } catch (e) {
        yield KehilanganFetchError(error: e.toString());
      }
    }
  }
}
