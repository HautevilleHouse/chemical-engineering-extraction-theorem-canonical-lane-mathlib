import HautevilleHouse.ChemicalEngineeringExtractionTheoremCanonicalLaneLean.ExtractionProcessDesign

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

structure ChemicalExtractionAdmittedObject where
  extractionSystem : String
  solute : String
  solvent : String
  feed : String
  equilibriumDataAvailable : Prop
  massTransferDataAvailable : Prop
  stageEfficiencyDataAvailable : Prop
  designProcedureCompleted : Prop
  conclusion : Prop

def ExtractionWitnessClosed (O : ChemicalExtractionAdmittedObject) : Prop :=
  O.conclusion

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse