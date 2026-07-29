import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure BlockKriging where
  blockSupport : Type u
  averageCovariance : Type v
  changeOfSupportModel : Prop
  blockEstimatorComputed : Prop

structure BlockKrigingEvidence (B : BlockKriging) where
  changeOfSupportModelClosed : B.changeOfSupportModel
  blockEstimatorComputedClosed : B.blockEstimatorComputed

def BlockKrigingClosed (B : BlockKriging) : Prop :=
  B.changeOfSupportModel ∧ B.blockEstimatorComputed

theorem block_kriging_closed_from_evidence (B : BlockKriging)
    (E : BlockKrigingEvidence B) : BlockKrigingClosed B := by
  exact And.intro E.changeOfSupportModelClosed E.blockEstimatorComputedClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse