import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure SpatialPredictionError where
  estimationVariance : ℝ
  krigingVariance : ℝ
  confidenceInterval : ℝ → ℝ
  errorBounds : Prop
  varianceNonnegative : estimationVariance ≥ 0 ∧ krigingVariance ≥ 0

structure PredictionErrorEvidence (P : SpatialPredictionError) where
  varNonnegClosed : P.varianceNonnegative
  boundsClosed : P.errorBounds

def PredictionErrorClosed (P : SpatialPredictionError) : Prop :=
  P.varianceNonnegative ∧ P.errorBounds

theorem prediction_error_closed_from_evidence (P : SpatialPredictionError) (E : PredictionErrorEvidence P) :
    PredictionErrorClosed P := by
  exact And.intro E.varNonnegClosed E.boundsClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse