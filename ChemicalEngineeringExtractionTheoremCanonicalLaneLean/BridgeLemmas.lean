import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringExtractionTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringExtractionTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ExtractionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringExtractionTheoremCanonicalLaneLean
end HautevilleHouse