import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure EarthScienceAdmissibleObject where
  spatialDomain : Type u
  covarianceModel : VariogramModel
  estimationMethod : KrigingEstimator spatialDomain
  inversionMethod : GeostatisticalInversion spatialDomain

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse