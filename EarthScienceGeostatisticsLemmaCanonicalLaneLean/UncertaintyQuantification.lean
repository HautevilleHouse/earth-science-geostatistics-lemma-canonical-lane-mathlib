import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure UncertaintyQuantification where
  predictionVariance : ℝ
  confidenceInterval : ℝ × ℝ
  coverageProbability : ℝ
  gaussianProcessAssumption : Prop
  varianceBound : Prop

structure UncertaintyEvidence (U : UncertaintyQuantification) where
  gaussianProcessAssumptionClosed : U.gaussianProcessAssumption
  varianceBoundClosed : U.varianceBound

def UncertaintyClosed (U : UncertaintyQuantification) : Prop :=
  U.gaussianProcessAssumption ∧ U.varianceBound

theorem uncertainty_closed_from_evidence (U : UncertaintyQuantification) (E : UncertaintyEvidence U) :
    UncertaintyClosed U := by
  exact And.intro E.gaussianProcessAssumptionClosed E.varianceBoundClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse