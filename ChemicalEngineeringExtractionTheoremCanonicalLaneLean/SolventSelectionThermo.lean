import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure SolventSelectionThermoPackage where
  selectivity : ℝ
  capacity : ℝ
  immiscibility : Prop
  solventRecoveryPossible : Prop
  selectivityTerm : selectivity > 0
  capacityTerm : capacity > 0
  immiscibilityTerm : immiscibility
  solventRecoveryPossibleTerm : solventRecoveryPossible

structure SolventSelectionThermoEvidence (S : SolventSelectionThermoPackage) where
  selectivityClosed : S.selectivity > 0
  capacityClosed : S.capacity > 0
  immiscibilityClosed : S.immiscibility
  solventRecoveryPossibleClosed : S.solventRecoveryPossible

def SolventSelectionThermoClosed (S : SolventSelectionThermoPackage) : Prop :=
  (S.selectivity > 0) ∧ (S.capacity > 0) ∧ S.immiscibility ∧ S.solventRecoveryPossible

theorem solvent_selection_thermo_closed_from_evidence
    (S : SolventSelectionThermoPackage) (Ev : SolventSelectionThermoEvidence S) :
    SolventSelectionThermoClosed S := by
  exact And.intro Ev.selectivityClosed
    (And.intro Ev.capacityClosed
      (And.intro Ev.immiscibilityClosed Ev.solventRecoveryPossibleClosed))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse