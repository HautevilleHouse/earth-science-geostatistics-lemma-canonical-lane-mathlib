import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure SpatialContinuityModel where
  spatialDomain : Type u
  continuityMeasure : Type v
  nuggetEffect : Prop
  sill : Prop
  range : Prop
  anisotropy : Bool

structure SpatialContinuityEvidence (S : SpatialContinuityModel) where
  nuggetEffectClosed : S.nuggetEffect
  sillClosed : S.sill
  rangeClosed : S.range

def SpatialContinuityClosed (S : SpatialContinuityModel) : Prop :=
  S.nuggetEffect ∧ S.sill ∧ S.range

theorem spatial_continuity_closed_from_evidence (S : SpatialContinuityModel)
    (E : SpatialContinuityEvidence S) : SpatialContinuityClosed S := by
  exact And.intro E.nuggetEffectClosed
    (And.intro E.sillClosed E.rangeClosed)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse