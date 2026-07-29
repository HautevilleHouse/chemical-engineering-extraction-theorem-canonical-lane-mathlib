import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure CountercurrentStageModelPackage where
  numberOfStages : ℕ
  feedFlowRate : ℝ
  solventFlowRate : ℝ
  stageEfficiency : ℝ
  materialBalanceClosed : Prop
  equilibriumLineCalculated : Prop
  operatingLineCalculated : Prop
  materialBalanceClosedTerm : materialBalanceClosed
  equilibriumLineCalculatedTerm : equilibriumLineCalculated
  operatingLineCalculatedTerm : operatingLineCalculated

structure CountercurrentStageModelEvidence (C : CountercurrentStageModelPackage) where
  materialBalanceClosedClosed : C.materialBalanceClosed
  equilibriumLineCalculatedClosed : C.equilibriumLineCalculated
  operatingLineCalculatedClosed : C.operatingLineCalculated

def CountercurrentStageModelClosed (C : CountercurrentStageModelPackage) : Prop :=
  C.materialBalanceClosed ∧ C.equilibriumLineCalculated ∧ C.operatingLineCalculated

theorem countercurrent_stage_model_closed_from_evidence
    (C : CountercurrentStageModelPackage) (Ev : CountercurrentStageModelEvidence C) :
    CountercurrentStageModelClosed C := by
  exact And.intro Ev.materialBalanceClosedClosed
    (And.intro Ev.equilibriumLineCalculatedClosed Ev.operatingLineCalculatedClosed)

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse