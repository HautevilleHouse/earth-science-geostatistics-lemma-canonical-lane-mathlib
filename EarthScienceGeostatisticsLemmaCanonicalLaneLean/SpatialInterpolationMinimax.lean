import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure SpatialInterpolationPackage where
  sampleLocations : Type u
  sampleValues : sampleLocations -> ℝ
  targetLocations : Type v
  interpolationMethod : (sampleLocations -> ℝ) -> targetLocations -> ℝ
  optimalityCriterion : Prop
  minimaxOptimal : Prop

structure SpatialInterpolationEvidence (I : SpatialInterpolationPackage) where
  optimalityCriterionClosed : I.optimalityCriterion
  minimaxOptimalClosed : I.minimaxOptimal

def SpatialInterpolationClosed (I : SpatialInterpolationPackage) : Prop :=
  I.optimalityCriterion ∧ I.minimaxOptimal

theorem spatial_interpolation_closed_from_evidence
    (I : SpatialInterpolationPackage) (E : SpatialInterpolationEvidence I) :
    SpatialInterpolationClosed I := by
  exact And.intro E.optimalityCriterionClosed E.minimaxOptimalClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse