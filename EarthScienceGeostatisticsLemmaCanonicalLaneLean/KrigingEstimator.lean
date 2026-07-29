import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure KrigingEstimator where
  locationSet : Type u
  covarianceFunction : Type v
  weights : Type w
  unbiasednessConstraint : Prop
  optimalityCondition : Prop

structure KrigingEvidence (K : KrigingEstimator) where
  unbiasednessConstraintClosed : K.unbiasednessConstraint
  optimalityConditionClosed : K.optimalityCondition

def KrigingClosed (K : KrigingEstimator) : Prop :=
  K.unbiasednessConstraint ∧ K.optimalityCondition

theorem kriging_closed_from_evidence (K : KrigingEstimator)
    (E : KrigingEvidence K) : KrigingClosed K := by
  exact And.intro E.unbiasednessConstraintClosed E.optimalityConditionClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse