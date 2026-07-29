import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure GeostatisticalInversion {S : SpatialCorrelationStructure} where
  forwardModel : S.domain → ℝ
  observations : S.domain → ℝ
  inverseSolution : S.domain → ℝ
  regularization : Prop
  uniquenessCondition : Prop

structure InversionEvidence {S : SpatialCorrelationStructure} (I : GeostatisticalInversion S) where
  regularizationClosed : I.regularization
  uniquenessClosed : I.uniquenessCondition

def InversionClosed {S : SpatialCorrelationStructure} (I : GeostatisticalInversion S) : Prop :=
  I.regularization ∧ I.uniquenessCondition

theorem inversion_closed_from_evidence {S : SpatialCorrelationStructure} (I : GeostatisticalInversion S)
    (E : InversionEvidence I) : InversionClosed I := by
  exact And.intro E.regularizationClosed E.uniquenessClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse