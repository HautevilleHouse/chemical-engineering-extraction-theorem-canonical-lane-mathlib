import HautevilleHouse.ChemicalEngineeringExtractionTheoremCanonicalLaneLean.StageEfficiency

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionProcessDesignPackage where
  feedFlowRate : ℝ
  solventFlowRate : ℝ
  solventSelectivity : ℝ
  numberOfStages : ℕ
  recoveryFraction : ℝ
  designObjectiveMet : Prop
  economicFeasibility : Prop

structure ExtractionProcessDesignEvidence (D : ExtractionProcessDesignPackage) where
  feedFlowRateClosed : D.feedFlowRate > 0
  solventFlowRateClosed : D.solventFlowRate > 0
  solventSelectivityClosed : D.solventSelectivity > 1
  numberOfStagesClosed : D.numberOfStages > 0
  recoveryFractionClosed : D.recoveryFraction > 0 ∧ D.recoveryFraction ≤ 1
  designObjectiveMetClosed : D.designObjectiveMet
  economicFeasibilityClosed : D.economicFeasibility

def ExtractionProcessDesignClosed (D : ExtractionProcessDesignPackage) : Prop :=
  D.feedFlowRate > 0 ∧
  D.solventFlowRate > 0 ∧
  D.solventSelectivity > 1 ∧
  D.numberOfStages > 0 ∧
  (D.recoveryFraction > 0 ∧ D.recoveryFraction ≤ 1) ∧
  D.designObjectiveMet ∧
  D.economicFeasibility

theorem extraction_process_design_closed_from_evidence
    (D : ExtractionProcessDesignPackage) (Ev : ExtractionProcessDesignEvidence D) :
    ExtractionProcessDesignClosed D := by
  exact And.intro Ev.feedFlowRateClosed
    (And.intro Ev.solventFlowRateClosed
      (And.intro Ev.solventSelectivityClosed
        (And.intro Ev.numberOfStagesClosed
          (And.intro Ev.recoveryFractionClosed
            (And.intro Ev.designObjectiveMetClosed
              Ev.economicFeasibilityClosed)))))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse