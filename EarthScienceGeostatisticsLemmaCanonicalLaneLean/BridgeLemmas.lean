import EarthScienceGeostatisticsLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GeostatisticsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse
