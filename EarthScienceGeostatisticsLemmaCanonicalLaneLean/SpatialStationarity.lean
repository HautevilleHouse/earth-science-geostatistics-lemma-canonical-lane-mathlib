import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure SpatialStationarityHypothesis where
  meanConstant : Prop
  covarianceStationary : Prop
  intrinsicHypothesis : Prop
  meanHomogeneous : meanConstant
  covDependsOnLag : covarianceStationary
  incrementsStationary : intrinsicHypothesis

structure StationarityEvidence (H : SpatialStationarityHypothesis) where
  meanClosed : H.meanConstant
  covClosed : H.covarianceStationary
  incrClosed : H.intrinsicHypothesis

def StationarityClosed (H : SpatialStationarityHypothesis) : Prop :=
  H.meanConstant ∧ H.covarianceStationary ∧ H.intrinsicHypothesis

theorem stationarity_closed_from_evidence (H : SpatialStationarityHypothesis) (E : StationarityEvidence H) :
    StationarityClosed H := by
  exact And.intro E.meanClosed (And.intro E.covClosed E.incrClosed)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse