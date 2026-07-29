import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringExtractionTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse