import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionThermodynamicsPackage where
  liquidVaporEquilibrium : Type u₀
  activityCoefficientModel : Type u₁
  distributionCoefficient : Type u₂
  selectivity : Prop
  relativeVolatility : Prop
  equilibriumLineAdmissible : Prop
  selectivityClosed : Prop

structure ExtractionThermodynamicsEvidence (T : ExtractionThermodynamicsPackage) where
  selectivityClosed : T.selectivity
  relativeVolatilityClosed : T.relativeVolatility
  equilibriumLineAdmissibleClosed : T.equilibriumLineAdmissible
  selectivityClosed : T.selectivityClosed

def ExtractionThermodynamicsClosed (T : ExtractionThermodynamicsPackage) : Prop :=
  T.selectivity ∧ T.relativeVolatility ∧ T.equilibriumLineAdmissible ∧ T.selectivityClosed

theorem extraction_thermodynamics_closed_from_evidence (T : ExtractionThermodynamicsPackage)
    (E : ExtractionThermodynamicsEvidence T) : ExtractionThermodynamicsClosed T := by
  exact And.intro E.selectivityClosed
    (And.intro E.relativeVolatilityClosed
      (And.intro E.equilibriumLineAdmissibleClosed E.selectivityClosed))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse
