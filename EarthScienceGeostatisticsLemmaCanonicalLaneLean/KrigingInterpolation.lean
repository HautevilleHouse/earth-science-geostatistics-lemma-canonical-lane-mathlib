import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure KrigingSystem where
  n : ℕ
  covarianceMatrix : Matrix (Fin n) (Fin n) ℝ
  rhsVector : Fin n → ℝ
  weights : Fin n → ℝ
  krigingVariance : ℝ
  systemSoluble : Prop
  weightsFound : weights ≠ λ _ => 0

structure KrigingEvidence (K : KrigingSystem) where
  solubleClosed : K.systemSoluble
  weightsClosed : K.weightsFound

def KrigingClosed (K : KrigingSystem) : Prop :=
  K.systemSoluble ∧ K.weightsFound

theorem kriging_closed_from_evidence (K : KrigingSystem) (E : KrigingEvidence K) :
    KrigingClosed K := by
  exact And.intro E.solubleClosed E.weightsClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse