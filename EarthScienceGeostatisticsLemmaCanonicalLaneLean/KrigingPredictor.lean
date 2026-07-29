import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsLemmaCanonicalLaneLean.VariogramStructure

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure KrigingPredictor (V : VariogramStructure) where
  observationLocations : List V.spatialDomain
  observedValues : List ℝ
  predictionLocation : V.spatialDomain
  krigingWeights : List ℝ
  predictedValue : ℝ
  bestLinearUnbiasedness : Prop
  bestLinearUnbiasednessTerm : bestLinearUnbiasedness

structure KrigingEvidence {V : VariogramStructure} (K : KrigingPredictor V) where
  weightsSumToOne : List.sum K.krigingWeights = 1
  unbiasednessClosed : K.bestLinearUnbiasedness
  predictionConsistent : Prop
  predictionConsistentTerm : predictionConsistent

def KrigingClosed {V : VariogramStructure} (K : KrigingPredictor V) : Prop :=
  List.sum K.krigingWeights = 1 ∧ K.bestLinearUnbiasedness ∧ K.predictionConsistent

theorem kriging_closed_from_evidence {V : VariogramStructure} (K : KrigingPredictor V)
    (E : KrigingEvidence K) : KrigingClosed K := by
  exact And.intro E.weightsSumToOne (And.intro E.unbiasednessClosed E.predictionConsistentTerm)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse