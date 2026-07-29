import ChemicalEngineeringExtractionTheoremCanonicalLaneLean.ChemicalPotential

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ThermodynamicPackage (P : ChemicalPotentialPackage) where
  activityCoefficient : Prop
  fugacityCoefficient : Prop
  excessGibbsEnergy : Prop
  phaseStability : Prop

structure ThermodynamicEvidence {P : ChemicalPotentialPackage} (T : ThermodynamicPackage P) where
  activityCoefficientClosed : T.activityCoefficient
  fugacityCoefficientClosed : T.fugacityCoefficient
  excessGibbsEnergyClosed : T.excessGibbsEnergy
  phaseStabilityClosed : T.phaseStability

def ThermodynamicClosed {P : ChemicalPotentialPackage} (T : ThermodynamicPackage P) : Prop :=
  T.activityCoefficient ∧ T.fugacityCoefficient ∧ T.excessGibbsEnergy ∧ T.phaseStability

theorem thermodynamic_closed_from_evidence {P : ChemicalPotentialPackage} (T : ThermodynamicPackage P) (E : ThermodynamicEvidence T) : ThermodynamicClosed T := by
  exact And.intro E.activityCoefficientClosed
    (And.intro E.fugacityCoefficientClosed
      (And.intro E.excessGibbsEnergyClosed E.phaseStabilityClosed))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse
