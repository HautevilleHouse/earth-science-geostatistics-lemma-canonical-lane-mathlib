import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure UniversalKrigingModel where
  trendBasis : Type u
  covarianceModel : Type v
  trendCoefficients : Type w
  unbiasednessConstraint : Prop
  bestLinearUnbiasedPredictor : Prop

structure UniversalKrigingEvidence (U : UniversalKrigingModel) where
  unbiasednessConstraintClosed : U.unbiasednessConstraint
  bestLinearUnbiasedPredictorClosed : U.bestLinearUnbiasedPredictor

def UniversalKrigingClosed (U : UniversalKrigingModel) : Prop :=
  U.unbiasednessConstraint ∧ U.bestLinearUnbiasedPredictor

theorem universal_kriging_closed_from_evidence
    (U : UniversalKrigingModel) (E : UniversalKrigingEvidence U) :
    UniversalKrigingClosed U := by
  exact And.intro E.unbiasednessConstraintClosed E.bestLinearUnbiasedPredictorClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse