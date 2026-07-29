import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure VariogramStructure where
  lag : Type u
  variance : Type v
  stationarityAssumption : Prop
  isotropic : Prop
  variogramModel : lag → variance
  modelingComplete : Prop

structure VariogramEvidence (V : VariogramStructure) where
  stationarityAssumptionClosed : V.stationarityAssumption
  isotropicClosed : V.isotropic
  modelingCompleteClosed : V.modelingComplete

def VariogramClosed (V : VariogramStructure) : Prop :=
  V.stationarityAssumption ∧ V.isotropic ∧ V.modelingComplete

theorem variogram_closed_from_evidence (V : VariogramStructure)
    (E : VariogramEvidence V) : VariogramClosed V := by
  exact And.intro E.stationarityAssumptionClosed
    (And.intro E.isotropicClosed E.modelingCompleteClosed)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse