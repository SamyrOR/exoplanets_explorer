import 'package:freezed_annotation/freezed_annotation.dart';

part 'exoplanet.freezed.dart';

@freezed
class Exoplanet with _$Exoplanet {
  const factory Exoplanet({
    required String hostName,
    required String planetName,
    required String planetLetter,
    required String hdID,
    required String hipID,
    required String ticID,
    required String gaiaID,
    required String starsNumber,
    required String planetsNumber,
    required String moonsNumber,
    required String discoveryMethod,
    required String discoveryYear,
    required String discoveryReference,
    required String discoveryPublicationDate,
    required String discoveryLocale,
    required String discoveryFacility,
    required String discoveryTelescope,
    required String discoveryInstrument,
    required String orbitalPeriod,
    required String planetRadius,
    required String planetMass,
    required String equilibriumTemperature,
    required String spectralType,
    required String distance,
    required DateTime dateLastUpdate,
    required DateTime releaseDate,
  }) = _Exoplanet;
}
