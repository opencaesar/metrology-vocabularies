# N. Rouquette's review of VIM4 CD

## Distinction between general and individual quantities

The OML-based metrology vocabulary encoded "quantity" [VIM3: 1.1] as an OML instance classified by a "kind-of-quantity" [VIM3: 1.2] encoded as an OML concept.
This was a non-trivial encoding that generated many questions from users and required a lot of explaining to convey.
The VIM4 change of terminology will result in a more natural alignment between the VIM4 terminology (general vs. individual quantity) and the OML encoding (concept vs. instance).

## VIM4 carefully avoids the VIM3 notion of a quantity as a property of something.

VIM4 CD looses a useful characteristic of the definition "quantity" [VIM3: 1.1] as a 'property of a phenomenon, body, or substance'.
In [OonP: S.5.4.1], Dybkaer explains:
> Any instance of "property" will be considered to be *inherent in* or *immanent in* an instance of "system" [OonP: S.3.3] including any pertinent "components" [OonP: S.3.4]'.

In OML, this inherent characteristic was previously encoded as an associative relation between the OML encoding of "quantity" [VIM3: 1.1] (as a "property" [OonP: S.5.5]) 
and "object" [OonP: S.2.23] following [OonP: Figure 2.25]. 
With the VIM4 distinction between general/individual quantity corresponding to the 
notion of instantiation, it makes sense to encode this inherent characteristic
at the level of a "general quantity" [VIM4 CD: 1.1] so that it can be instantiated at the level of an
"individual quantity" [VIM4 CD: 1.2] for an "object" [OonP: S.2.23] or set of such.


## [ISQ1](src/oml/bipm.org/jcgm/isq1.oml)

- Modeling general quantities: as OML instances of vim:GeneralUnitaryQuantity

  Note: to enforce unicity, it is necessary to use a functional scalar property and a key axiom.

- Modeling taxonomic specializations of general quantities: requires additional OML relation.

## [ISQ2](src/oml/bipm.org/jcgm/isq2.oml)

- Modeling general quantities: as OML concepts specializing vim:GeneralUnitaryQuantity

  Note: the OML bundle closure algorithm will create disjointness axioms for general quantity concepts.

- Modeling taxonomic specializations of general quantities: as OML concept specializations

  Note: the extension [vim4-inheres](src/oml/bipm.org/jcgm/vim4-inheres.oml) supports 
  defining taxonomic specializations of `vim4-inheres:Object`, which in turn can serve 
  as restrictions of the `vim4-inheres:inheres` relation between a `vim4:GeneralQuantity`
  and a `vim4-inheres:Object`.
  
  For example, this allows for defining lengths of classes of objects such as lengths of 
  pencils and cars.
