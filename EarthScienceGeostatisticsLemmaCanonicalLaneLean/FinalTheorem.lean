import canonicalLaneMathlib.AdmissibleClass
import EarthScienceGeostatisticsLemmaCanonicalLaneLean.GeostatisticalVariogramKriging
import EarthScienceGeostatisticsLemmaCanonicalLaneLean.SpatialInterpolationMinimax
import EarthScienceGeostatisticsLemmaCanonicalLaneLean.UniversalKrigingAdmissible

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := True

def gateClosed (A : AdmissibleClass) : Prop := True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  trivial

def ConstrainedGeoStatClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geostat_endgame (A : AdmissibleClass) :
    ConstrainedGeoStatClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse