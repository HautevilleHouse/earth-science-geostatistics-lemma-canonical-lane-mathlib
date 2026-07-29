import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure CrossValidationDiagnostics where
  validationPoints : Type u
  predictedValues : Type v
  observedValues : Type v
  errorMetrics : Type w
  meanSquaredErrorComputed : Prop
  biasDetected : Bool

structure CrossValidationEvidence (C : CrossValidationDiagnostics) where
  meanSquaredErrorComputedClosed : C.meanSquaredErrorComputed

def CrossValidationClosed (C : CrossValidationDiagnostics) : Prop :=
  C.meanSquaredErrorComputed

theorem cross_validation_closed_from_evidence (C : CrossValidationDiagnostics)
    (E : CrossValidationEvidence C) : CrossValidationClosed C := by
  exact E.meanSquaredErrorComputedClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse