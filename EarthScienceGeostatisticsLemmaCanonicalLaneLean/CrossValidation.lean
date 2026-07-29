import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsLemmaCanonicalLaneLean.KrigingPredictor

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure CrossValidationResult (V : VariogramStructure) where
  leaveOneOutPredictions : List (V.spatialDomain × ℝ × ℝ)  -- location, observed, predicted
  meanSquaredError : ℝ
  meanAbsoluteError : ℝ
  correlationObservedPredicted : ℝ
  mseAdequate : Prop
  mseAdequateTerm : mseAdequate

structure CrossValidationEvidence {V : VariogramStructure} (C : CrossValidationResult V) where
  mseClosed : C.mseAdequate
  maePositive : C.meanAbsoluteError ≥ 0
  correlationPositive : C.correlationObservedPredicted > 0

def CrossValidationClosed {V : VariogramStructure} (C : CrossValidationResult V) : Prop :=
  C.mseAdequate ∧ C.meanAbsoluteError ≥ 0 ∧ C.correlationObservedPredicted > 0

theorem cross_validation_closed_from_evidence {V : VariogramStructure} (C : CrossValidationResult V)
    (E : CrossValidationEvidence C) : CrossValidationClosed C := by
  exact And.intro E.mseClosed (And.intro E.maePositive E.correlationPositive)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse