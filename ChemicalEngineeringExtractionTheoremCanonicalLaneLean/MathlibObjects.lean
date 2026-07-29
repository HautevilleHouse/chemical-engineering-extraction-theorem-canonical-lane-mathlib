import ChemicalEngineeringExtractionTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ChemicalExtractionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ChemicalExtractionAdmittedObject where
  space : ChemicalExtractionSpace
  extractionProcess : Prop
  equilibriumReached : Prop
  separationModel : Type
  separationTopology : TopologicalSpace separationModel
  yieldsTargetProduct : Prop
  conclusion : yieldsTargetProduct

structure ChemicalExtractionEndgameState where
  object : ChemicalExtractionAdmittedObject

def ExtractionWitnessClosed (O : ChemicalExtractionAdmittedObject) : Prop :=
  O.yieldsTargetProduct

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse
