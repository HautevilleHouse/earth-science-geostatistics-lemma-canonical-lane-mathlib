import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure SpatialCorrelationStructure where
  domain : Type u
  coordinates : domain → ℝ³
  covarianceFunction : domain → domain → ℝ
  stationarityAssumption : Prop
  isotropyAssumption : Prop
  positiveDefiniteness : Prop

structure SpatialCorrelationEvidence (S : SpatialCorrelationStructure) where
  stationarityClosed : S.stationarityAssumption
  isotropyClosed : S.isotropyAssumption
  positiveDefinitenessClosed : S.positiveDefiniteness

def SpatialCorrelationClosed (S : SpatialCorrelationStructure) : Prop :=
  S.stationarityAssumption ∧ S.isotropyAssumption ∧ S.positiveDefiniteness

theorem spatial_correlation_closed_from_evidence (S : SpatialCorrelationStructure)
    (E : SpatialCorrelationEvidence S) : SpatialCorrelationClosed S := by
  exact And.intro E.stationarityClosed (And.intro E.isotropyClosed E.positiveDefinitenessClosed)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse