import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsLemmaCanonicalLaneLean.VariogramStructure

namespace HautevilleHouse
namespace EarthScienceGeostatisticsLemmaCanonicalLaneLean

structure GaussianProcessRegression (V : VariogramStructure) where
  covarianceFunction : V.spatialDomain → V.spatialDomain → ℝ
  meanFunction : V.spatialDomain → ℝ
  trainingData : List (V.spatialDomain × ℝ)
  posteriorMean : V.spatialDomain → ℝ
  posteriorVariance : V.spatialDomain → ℝ
  logMarginalLikelihood : ℝ
  covarianceValid : Prop
  covarianceValidTerm : covarianceValid

structure GaussianProcessEvidence {V : VariogramStructure} (G : GaussianProcessRegression V) where
  covarianceValidClosed : G.covarianceValid
  posteriorMeanDerived : Prop
  posteriorMeanDerivedTerm : posteriorMeanDerived
  posteriorVarianceDerived : Prop
  posteriorVarianceDerivedTerm : posteriorVarianceDerived

def GaussianProcessClosed {V : VariogramStructure} (G : GaussianProcessRegression V) : Prop :=
  G.covarianceValid ∧ G.posteriorMeanDerived ∧ G.posteriorVarianceDerived

theorem gaussian_process_closed_from_evidence {V : VariogramStructure}
    (G : GaussianProcessRegression V) (E : GaussianProcessEvidence G) :
    GaussianProcessClosed G := by
  exact And.intro E.covarianceValidClosed (And.intro E.posteriorMeanDerivedTerm E.posteriorVarianceDerivedTerm)

end EarthScienceGeostatisticsLemmaCanonicalLaneLean
end HautevilleHouse