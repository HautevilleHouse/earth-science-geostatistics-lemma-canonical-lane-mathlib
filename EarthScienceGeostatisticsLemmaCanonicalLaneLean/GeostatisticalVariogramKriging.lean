import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure GeostatisticalVariogramPackage where
  spatialField : Type u
  locations : Type v
  variogramModel : locations -> locations -> ℝ
  intrinsicStationarity : Prop
  variogramProperties : Prop

structure GeostatisticalKrigingPackage (V : GeostatisticalVariogramPackage) where
  krigingPredictor : V.locations -> V.spatialField
  krigingVariance : V.locations -> ℝ
  blupOptimality : Prop
  krigingSystemSolved : Prop

structure GeostatisticalVariogramEvidence (V : GeostatisticalVariogramPackage) where
  intrinsicStationarityClosed : V.intrinsicStationarity
  variogramPropertiesClosed : V.variogramProperties

structure GeostatisticalKrigingEvidence {V : GeostatisticalVariogramPackage}
    (K : GeostatisticalKrigingPackage V) where
  blupOptimalityClosed : K.blupOptimality
  krigingSystemSolvedClosed : K.krigingSystemSolved

def GeostatisticalVariogramClosed (V : GeostatisticalVariogramPackage) : Prop :=
  V.intrinsicStationarity ∧ V.variogramProperties

def GeostatisticalKrigingClosed {V : GeostatisticalVariogramPackage}
    (K : GeostatisticalKrigingPackage V) : Prop :=
  K.blupOptimality ∧ K.krigingSystemSolved

theorem geostatistical_variogram_closed_from_evidence
    (V : GeostatisticalVariogramPackage) (E : GeostatisticalVariogramEvidence V) :
    GeostatisticalVariogramClosed V := by
  exact And.intro E.intrinsicStationarityClosed E.variogramPropertiesClosed

theorem geostatistical_kriging_closed_from_evidence
    {V : GeostatisticalVariogramPackage} (K : GeostatisticalKrigingPackage V)
    (E : GeostatisticalKrigingEvidence K) : GeostatisticalKrigingClosed K := by
  exact And.intro E.blupOptimalityClosed E.krigingSystemSolvedClosed

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse