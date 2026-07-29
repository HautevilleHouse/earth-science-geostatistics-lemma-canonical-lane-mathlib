import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure OrdinaryKrigingOptimality where
  unbiasedCondition : Prop
  mseMinimized : Prop
  lagrangeMultiplier : ℝ
  optimalWeights : Prop
  unbiasedSatisfied : unbiasedCondition
  mseMinimal : mseMinimized

structure OptimalityEvidence (O : OrdinaryKrigingOptimality) where
  unbiasedClosed : O.unbiasedCondition
  mseClosed : O.mseMinimized
  weightsOptimal : O.optimalWeights

def OptimalityClosed (O : OrdinaryKrigingOptimality) : Prop :=
  O.unbiasedCondition ∧ O.mseMinimized ∧ O.optimalWeights

theorem optimality_closed_from_evidence (O : OrdinaryKrigingOptimality) (E : OptimalityEvidence O) :
    OptimalityClosed O := by
  exact And.intro E.unbiasedClosed (And.intro E.mseClosed E.weightsOptimal)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse