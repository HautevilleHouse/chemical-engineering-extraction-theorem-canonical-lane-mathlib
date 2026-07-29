import ChemicalEngineeringExtractionTheoremCanonicalLaneLean.MassTransferKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionColumnModel (K : MassTransferPackage) where
  columnGeometry : Prop
  phaseFlowConfiguration : Prop
  stageEfficiency : Prop
  numberOfStages : Prop

structure ExtractionColumnEvidence {K : MassTransferPackage} (M : ExtractionColumnModel K) where
  columnGeometryClosed : M.columnGeometry
  phaseFlowConfigurationClosed : M.phaseFlowConfiguration
  stageEfficiencyClosed : M.stageEfficiency
  numberOfStagesClosed : M.numberOfStages

def ExtractionColumnClosed {K : MassTransferPackage} (M : ExtractionColumnModel K) : Prop :=
  M.columnGeometry ∧ M.phaseFlowConfiguration ∧ M.stageEfficiency ∧ M.numberOfStages

theorem extraction_column_closed_from_evidence {K : MassTransferPackage} (M : ExtractionColumnModel K) (E : ExtractionColumnEvidence M) : ExtractionColumnClosed M := by
  exact And.intro E.columnGeometryClosed
    (And.intro E.phaseFlowConfigurationClosed
      (And.intro E.stageEfficiencyClosed E.numberOfStagesClosed))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse
