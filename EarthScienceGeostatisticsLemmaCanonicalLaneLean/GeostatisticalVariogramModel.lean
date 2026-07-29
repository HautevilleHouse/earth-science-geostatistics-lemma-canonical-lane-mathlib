import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure VariogramModel where
  nugget : ℝ
  sill : ℝ
  range : ℝ
  modelType : String
  isValid : Prop
  nuggetPositive : nugget ≥ 0
  sillPositive : sill ≥ 0
  rangePositive : range ≥ 0

structure VariogramEvidence (V : VariogramModel) where
  nuggetClosed : V.nuggetPositive
  sillClosed : V.sillPositive
  rangeClosed : V.rangePositive
  modelValid : V.isValid

def VariogramModelClosed (V : VariogramModel) : Prop :=
  V.nuggetPositive ∧ V.sillPositive ∧ V.rangePositive ∧ V.isValid

theorem variogram_closed_from_evidence (V : VariogramModel) (E : VariogramEvidence V) :
    VariogramModelClosed V := by
  exact And.intro E.nuggetClosed (And.intro E.sillClosed (And.intro E.rangeClosed E.modelValid))

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse