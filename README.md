# Metrology Vocabulary

[![Build Status](https://github.com/opencaesar/metrology-vocabularies/actions/workflows/ci.yml/badge.svg)](https://github.com/opencaesar/metrology-vocabularies/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/opencaesar/metrology-vocabularies?label=Release)](https://github.com/opencaesar/metrology-vocabularies/releases/latest)
[![Documentation](https://img.shields.io/badge/Documentation-HTML-orange)](https://www.opencaesar.io/metrology-vocabularies/) 

This vocabulary was originally based on VIM3 (see https://jcgm.bipm.org/vim/en/info.html); 
however, the VIM3 distinction between quantity [VIM3: 1.1] and
kind-of-quantity [VIM3: 1.2] led to using Prof. Rene Dybkaer's seminal work, 
[An ontology on property](http://ontology.iupac.org/), as a source of guidance
for formalizing a VIM3-like vocabulary of metrology for quantities and units.

The VIM4 Committee Draft of January 11, 2021 constitutes a welcome improvement
in the precision and meaning of the vocabulary, that, together with related JCGM
documents explaining the significant changes from VIM3 to VIM4 greatly facilitated
formalizing VIM4 as an ontology. This formalized vocabulary is made publicly 
available with the objective of providing additional input to the upcoming 
25th meeting of the JCGM scheduled for 05 December 2022 with respect
to publication options considered for VIM4 (see 'Development Line 2: adding machine readability' in Report from WG2 [JCGM/2020-07](https://www.bipm.org/en/search?p_p_id=search_portlet&p_p_lifecycle=2&p_p_state=normal&p_p_mode=view&p_p_resource_id=%2Fdownload%2Fpublication&p_p_cacheability=cacheLevelPage&_search_portlet_dlFileId=53507162&p_p_lifecycle=1&_search_portlet_javax.portlet.action=search&_search_portlet_page=next&_search_portlet_operation=changePage)).

Update from VIM4 Committee Draft of July 31, 2023.

- Whereas the VIM4 CD1 made an explicit distinction between 'general quantity' (VIM4 CD1: 1.1) and 
  'individual quantity' (VIM4 CD1: 1.2), VIM4 CD2 removes this distinction altogether. This OML vocabulary
  retains this important distinction largely from VIM4 CD1 to support asserting that an individual quantity
  is an instance of a general quantity (see VIM4 CD1: 1.1, Note 2 and VIM4 CD2: 1.1, Note 2).

- Whereas the VIM4 CD1 made distinctions among ratio, ordinal and interval quantities sometimes in notes
  and sometimes in definitions, the VIM4 CD2 defines the three categories of quantities explicitly
  (VIM4 CD2: 1.3, 1.4, 1.33). Moreover, VIM4 CD2 broadens the notion of 'system of quantities' (VIM4 CD2: 1.5 vs. VIM4 CD1: 1.3) where the scope of quantities in a system excludes ordinal quantities 
  but includes ratio and interval quantities (see VIM4 CD2: 1.5, Note).

- Both VIM4 CD1 and CD2 define 'quantity dimension' (VIM4 CD1: 1.7 and VIM4 CD2: 1.9)
  via an implicit reference to the dimensional calculus where base quantities are 
  raised to a power.

### Changes since version 7

- Modified `vim4:IndividualProperty` (added `key instantiates, characterizes`)

- Renamed `vim4:GeneralUnitaryQuantity` to `vim4:GeneralRatioQuantity`
- Added `vim4:GeneralSystemQuantity < vim4:GeneralQuantity`
- Added `vim4:GeneralRatioQuantity < vim4:GeneralSystemQuantity`
- Added `vim4:GeneralIntervalQuantity < vim4:GeneralSystemQuantity`

- Added `vim4:IndividualSystemQuantity < vim4:IndividualQuantity`
- Renamed `vim4:IndividualUnitaryQuantity` to `vim4:IndividualRatioQuantity`
- Added `vim4:IndividualRatioQuantity < vim4:IndividualSystemQuantity`
- Added `Vim4:IndividualIntervalQuantity < vim4:IndividualSystemQuantity`

- Renamed `vim4:SystemHasUnitaryQuantity` to `vim4:SystemHasQuantity`
- Renamed `vim4:SystemHasBaseUnitaryQuantity` to `vim4:SystemHasBaseQuantity`

- Renamed `vim4:HasPowerOfUnitaryQuantityFactor` to `vim4:HasPowerOfQuantityFactor`

- Renamed `vim4:InherentUnitaryQuantity` to `vim4:InherentRatioQuantity`

- Renamed `vim4:UnitaryQuantityValue` to `vim4:RatioQuantityValue`

- Renamed `vim4:InherentUnitaryQuantityValue` to `vim4:InherentRatioQuantityValue`

- Renamed `vim4:InherentUnitaryQuantityValueReflexiveAttribution` to `vim4:InherentRatioQuantityValueReflexiveAttribution`

- Modified: `vim4:MeasurementUnit` (removed `restricts characterizes to exactly 0 Object`)

- Added `vim4:incoherent-derived-unit-implies-incoherent-system-of-units`

- Added `vim4:key_of_SystemHasQuantity`
- Added `vim4:key_of_SystemHasUnit`

- Modified `vim4:QuantityValue` (added `key isAttributedTo, id`)

## The following diagrams summarize the formalization of VIM4

### Taxonomy of properties

[VIM4.1-properties](diagrams/VIM4.1-properties.svg)

### Quantities, Units and Values

[VIM4.1-general,individual,units,values](diagrams/VIM4.1-general,individual,units,values.svg)

### Systems of Quantities and Units

[VIM4.1-systems](diagrams/VIM4.1-systems.svg)

Note that this representation supports multiple `SystemsOfQuantities` and `SystemsOfUnits`.
The formalization ensures that the following turtle pattern must be consistent
for all tuples of `SQ, SU, Q, M`:

```turtle
SQ a vim4:SystemOfQuantities ; vim4:systemHasUnitaryQuantity Q .
SU a vim4:SystemOfUnits ; vim4:given SQ ; vim4:systemHasUnit M .
M vim4:instantiates Q .
```

### Measurement Units

[VIM4.1-units](diagrams/VIM4.1-units.svg)

### Scales

[VIM4.1-scales](diagrams/VIM4.1-scales.svg)

### Measurement

[VIM4.2-Measurement](diagrams/VIM4.2.svg)

## OWL2-DL Unit Consistency Checking

[VIM4.1-unit consistency](diagrams/VIM4.1-unit-consistency.svg)

The formalization ensures that any `UnitaryQuantityValue` must be consistent 
in the sense that the following paths must lead to pairs of `GeneralUnitaryQuantity`, (`uq`, `aq`),
defined as follows:

- `uq` is any `GeneralUnitaryQuantity` reachable via the following SPARQL expression: `unit.isMultipleOf*.instantiates`

- `aq` is the `GeneralUnitaryQuantity` reachable via the following SPARQL expression:
`isAttributedTo.instantiates`

Then for each such pair, one of `uq.specializes*` must be the same as `aq`.

## Dimensional Analysis

Dimensional analysis is a procedure for determining what VIM4CD: 1.7 quantity dimension defines as the:
> relation of a quantity to the base quantities of a system of quantities as a product of powers of
factors corresponding to the base quantities, omitting any numerical factor

This analysis requires closed-world knowledge of the following:
 
- Instances of `SystemOfQuantities` (VIM4CD: 1.6)

- For each such system:

  - Instances of `GeneralUnitaryQuantity` that are its VIM4CD: 1.4 base quantities
  - Instances of `GeneralUnitaryQuantity` that are its VIM4CD: 1.5 derived quantities
    Each derivation in turn requires information about the derivation factors w.r.t other `GeneralUnitaryQuantities`
    
Formalizing this analysis in SPARQL 1.1 Query and Update should be possible in principle,
see [src/sparql/dimensional-analysis](src/sparql/dimensional-analysis) for such an attempt.

The strategy involves the following induction principle:

0) The initial step involves the special case of a base quantity, `bq`, for which the dimension is trivially 1 for `bq` and 0 for all other base quantities.
1) Find a derived quantity, `dq`, whose factors involve quantities with known dimensions. Calculate the dimension of` `dq` by raising the dimension of each dependency according to the corresponding factor and simplifying the resulting product of dimension factors.
2) Repeat step (1) until all derived quantities have been processed.

Trying to implement this strategy with SPARQL 1.1 queries and updates resulted in a few practical problems
using Apache Jena 4.3.2 (see: https://jena.apache.org/download/index.cgi):

1) According to the [SPARQL 1.1 Update](https://www.w3.org/TR/2013/REC-sparql11-update-20130321/#updateLanguage),
an update operation results in either success or failure. However, the specification does not stipulate the exact form of such a result. This makes it difficult to verify whether a particular update produced the desired triples.

For example, the update corresponding to step 0 is here:

[0-base-quantity-dimension.sparql](src/sparql/dimensional-analysis/0-base-quantity-dimension.sparql)

When submitting this update to Jena Fuseki, the server responds simply: `Update succeeded.`

Fortunately, one can easily confirm the update indeed worked with the following query: [quantity-dimensions.sparql](src/sparql/dimensional-analysis/quantity-dimensions.sparql)

For step 1, the following update was intended to handle the case of derived quantities 
that depend on a single quantity with a dimension: [1-derived-quantity-dimension.sparql](src/sparql/dimensional-analysis/1-derived-quantity-dimension.sparql)


When submitting this update to Jena Fuseki, the server responds simply: `Update succeeded.`

However, performing the query again shows that no new triples were inserted!
Changing the update to a query (see the commented `select` statement) produces
tuples that confirm the `where` clause is working properly. 
It is unclear why the `insert` for the same `where` clause does not actually insert these tuples.

2) Even if sparql query/update had worked, this approach for formalizing an inductive algorithm is very awkward.

To encode the closed-world semantics of this analysis in SPARQL, it is necessary to use non-trivial filter clauses to ensure that the `where` clause checks for all relevant cases.

This exercise warrants looking for a different strategy to implement dimensional analysis.