# Metrology Vocabulary

[![Build Status](https://app.travis-ci.com/opencaesar/metrology-vocabularies.svg?branch=master)](https://app.travis-ci.com/github/opencaesar/metrology-vocabularies)
[![Release](https://img.shields.io/github/v/tag/opencaesar/metrology-vocabularies?label=release)](https://github.com/opencaesar/metrology-vocabularies/releases/latest)
[![Documentation](https://img.shields.io/badge/Documentation-HTML-orange)](https://opencaesar.github.io/metrology-vocabularies/) 

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


## Important note about this repository

This repository depends on the branch `trig-format` of this fork: https://github.com/NicolasRouquette/core-vocabularies
until this PR is merged: https://github.com/opencaesar/core-vocabularies/pull/26

The [build.gradle](build.gradle) is configured to resolve the `core-vocabularies` from https://jitpack.io/#NicolasRouquette/core-vocabularies/
