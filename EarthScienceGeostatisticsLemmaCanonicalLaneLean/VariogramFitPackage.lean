import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure VariogramFitPackage (G : GeostatisticalModelPackage) where
  empiricalVariogram : VariogramStructures V
  theoreticalModel : VariogramType -> VariogramFunction
  fitCriterion : FitCriterionType
  parameterEstimate : ParameterVector
  residualGoodness : Prop
  residualGoodnessClosed : residualGoodness
  variogramEvidence : VariogramFitEvidence V
 
def VariogramFitClosed {G : GeostatisticalModelPackage} {V : VariogramStructures G} (F : VariogramFitPackage V) : Prop :=
  F.residualGoodness ∧ VariogramFitEvidenceClosed V

theorem variogram_fit_closed_from_evidence {G : GeostatisticalModelPackage} {V : VariogramStructures G} (F : VariogramFitPackage V) (E : VariogramFitEvidence V) : VariogramFitClosed F := by
  exact And.intro F.residualGoodnessClosed E

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse