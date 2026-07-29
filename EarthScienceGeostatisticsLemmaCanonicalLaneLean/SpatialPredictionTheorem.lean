import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure SpatialPredictionTheorem (G : GeostatisticalModelPackage) (V : VariogramStructures G) (K : KrigingEstimator V) where
  bestLinearUnbiasedPredictor : Prop
  predictionErrorVariance : Prop
  consistencyUnderInfill : Prop
  asymptoticNormality : Prop
  blupClosed : bestLinearUnbiasedPredictor
  varianceClosed : predictionErrorVariance
  consistencyClosed : consistencyUnderInfill
  normalityClosed : asymptoticNormality

def SpatialPredictionClosed (G : GeostatisticalModelPackage) (V : VariogramStructures G) (K : KrigingEstimator V) (P : SpatialPredictionTheorem K) : Prop :=
  P.bestLinearUnbiasedPredictor ∧ P.predictionErrorVariance ∧ P.consistencyUnderInfill ∧ P.asymptoticNormality

theorem spatial_prediction_closed_from_evidence (G : GeostatisticalModelPackage) (V : VariogramStructures G) (K : KrigingEstimator V) (P : SpatialPredictionTheorem K) (E : SpatialPredictionEvidence K) : SpatialPredictionClosed P := by
  exact And.intro P.blupClosed (And.intro P.varianceClosed (And.intro P.consistencyClosed P.normalityClosed))

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse