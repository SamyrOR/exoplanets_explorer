import 'package:exoplanets_explorer/data/services/exoplanets_api_client.dart';
import 'package:exoplanets_explorer/data/services/models/exoplanet_api_model.dart';
import 'package:exoplanets_explorer/domain/models/exoplanet.dart';

import '../../utils/result.dart';

class ExoplanetsRepository {
  final ExoplanetsApiClient _apiClient;

  ExoplanetsRepository({
    required ExoplanetsApiClient apiClient,
  }) : _apiClient = apiClient;

  Future<Result<List<Exoplanet>>> getExoplanets() async {
    try {
      final resultExoplanetsApi = await _apiClient.getExoplanets();
      switch (resultExoplanetsApi) {
        case Error<List<ExoplanetApiModel>>():
          return Result.error(resultExoplanetsApi.error);
        case Ok<List<ExoplanetApiModel>>():
      }
      final exoplanetsApi = resultExoplanetsApi.value;
      final exoplanets = exoplanetsApi
          .map(
            (exoplanetApi) => Exoplanet(
              hostName: exoplanetApi.hostname ?? '',
              planetName: exoplanetApi.plName ?? '',
              planetLetter: exoplanetApi.plLetter ?? '',
              hdID: exoplanetApi.hdName ?? '',
              hipID: exoplanetApi.hipName ?? '',
              ticID: exoplanetApi.ticId ?? '',
              gaiaID: exoplanetApi.gaiaId ?? '',
              starsNumber: exoplanetApi.sySnum ?? '',
              planetsNumber: exoplanetApi.syPnum ?? '',
              moonsNumber: exoplanetApi.syMnum ?? '',
              discoveryMethod: exoplanetApi.discoverymethod ?? '',
              discoveryYear: exoplanetApi.discYear ?? '',
              discoveryReference: exoplanetApi.discRefname ?? '',
              discoveryPublicationDate: exoplanetApi.discPubdate ?? '',
              discoveryLocale: exoplanetApi.discLocale ?? '',
              discoveryFacility: exoplanetApi.discFacility ?? '',
              discoveryTelescope: exoplanetApi.discTelescope ?? '',
              discoveryInstrument: exoplanetApi.discInstrument ?? '',
              orbitalPeriod: exoplanetApi.plOrbper ?? '',
              planetRadius: exoplanetApi.plRade ?? '',
              planetMass: exoplanetApi.plMasse ?? '',
              equilibriumTemperature: exoplanetApi.plEqt ?? '',
              spectralType: exoplanetApi.stSpectype ?? '',
              distance: exoplanetApi.syDist ?? '',
              dateLastUpdate: exoplanetApi.rowupdate != null
                  ? DateTime.parse(exoplanetApi.rowupdate!)
                  : DateTime.now(),
              releaseDate: exoplanetApi.rowupdate != null
                  ? DateTime.parse(exoplanetApi.releasedate!)
                  : DateTime.now(),
            ),
          )
          .toList();
      return Result.ok(exoplanets);
    } catch (error) {
      return Result.error(Exception("Failed to retrieve exoplanets"));
    }
  }
}
