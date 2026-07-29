import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure GeostatisticalModelPackage where
  domain : Type
  support : Type
  randomFunction : Type
  meanFunction : RandomField -> DomainValue -> DataValue
  covarianceStructure : CovarianceFunction
  intrinsicHypothesis : Nat
  stationarityOrder : Nat
  ergodicityCondition : Prop
  secondOrderStationary : Prop
  intrinsicStationary : Prop
  ergodicityConditionClosed : ergodicityCondition
  secondOrderStationaryClosed : secondOrderStationary
  intrinsicStationaryClosed : intrinsicStationary

def ModelClosed (G : GeostatisticalModelPackage) : Prop :=
  G.ergodicityCondition ∧ G.secondOrderStationary ∧ G.intrinsicStationary

theorem model_closed_from_evidence (G : GeostatisticalModelPackage) (E : ModelEvidence G) : ModelClosed G := by
  exact And.intro G.ergodicityConditionClosed (And.intro G.secondOrderStationaryClosed G.intrinsicStationaryClosed)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse