import ChemicalEngineeringExtractionTheoremCanonicalLaneLean.ExtractionKinetics
import ChemicalEngineeringExtractionTheoremCanonicalLaneLean.ExtractionThermodynamics

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ExtractionColumnDesignPackage {M : MassTransferPackage}
    {K : ExtractionKineticsPackage M} {P : PhaseEquilibriumPackage}
    {T : ExtractionThermodynamicsPackage P} where
  heightEquivalentTheoreticalStage : Prop
  numberOfStages : Prop
  columnDiameter : Prop
  floodingVelocity : Prop
  holdUp : Prop
  heightEquivalentTheoreticalStageClosed : heightEquivalentTheoreticalStage
  numberOfStagesClosed : numberOfStages
  columnDiameterClosed : columnDiameter
  floodingVelocityClosed : floodingVelocity
  holdUpClosed : holdUp

structure ExtractionColumnDesignEvidence {M : MassTransferPackage}
    {K : ExtractionKineticsPackage M} {P : PhaseEquilibriumPackage}
    {T : ExtractionThermodynamicsPackage P}
    (D : ExtractionColumnDesignPackage K T) where
  heightEquivalentTheoreticalStageClosed : D.heightEquivalentTheoreticalStage
  numberOfStagesClosed : D.numberOfStages
  columnDiameterClosed : D.columnDiameter
  floodingVelocityClosed : D.floodingVelocity
  holdUpClosed : D.holdUp

def ExtractionColumnDesignClosed {M : MassTransferPackage}
    {K : ExtractionKineticsPackage M} {P : PhaseEquilibriumPackage}
    {T : ExtractionThermodynamicsPackage P}
    (D : ExtractionColumnDesignPackage K T) : Prop :=
  D.heightEquivalentTheoreticalStage ∧ D.numberOfStages ∧
  D.columnDiameter ∧ D.floodingVelocity ∧ D.holdUp

theorem extraction_column_design_closed_from_evidence
    {M : MassTransferPackage} {K : ExtractionKineticsPackage M}
    {P : PhaseEquilibriumPackage} {T : ExtractionThermodynamicsPackage P}
    (D : ExtractionColumnDesignPackage K T)
    (E : ExtractionColumnDesignEvidence D) : ExtractionColumnDesignClosed D := by
  exact And.intro E.heightEquivalentTheoreticalStageClosed
    (And.intro E.numberOfStagesClosed
      (And.intro E.columnDiameterClosed
        (And.intro E.floodingVelocityClosed E.holdUpClosed)))

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse
