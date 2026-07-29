import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure VariogramModel where
  nugget : ℝ
  sill : ℝ
  range : ℝ
  variogramType : String  -- e.g., "spherical", "exponential", "gaussian"
  continuityAtOrigin : Prop
  boundedness : Prop

structure VariogramEvidence (V : VariogramModel) where
  continuityAtOriginClosed : V.continuityAtOrigin
  boundednessClosed : V.boundedness

def VariogramClosed (V : VariogramModel) : Prop :=
  V.continuityAtOrigin ∧ V.boundedness

theorem variogram_closed_from_evidence (V : VariogramModel) (E : VariogramEvidence V) :
    VariogramClosed V := by
  exact And.intro E.continuityAtOriginClosed E.boundednessClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse