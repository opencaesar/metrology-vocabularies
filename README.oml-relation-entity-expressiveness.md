# OMl Relation Entity Expressiveness Problems

Issue: https://github.com/opencaesar/oml/issues/88

## Example

1) Run: 

```
.\gradlew --no-daemon clean omlToOwlTrig owlReasonSimpleDescriptionTrig
```

2) There are no inconsistencies!

3) Open the file: /metrology-vocabularies/build/trig/example.org/some-domain.trig

4) Replace the following:

```
  :Performs a owl:Class;
    rdfs:subClassOf :IdentifiedElement;
    <http://purl.org/dc/elements/1.1/type> <http://opencaesar.io/oml#RelationEntity> .
```

with:

```
  :Performs a owl:Class;
    <http://purl.org/dc/elements/1.1/type> <http://opencaesar.io/oml#RelationEntity> ;
    owl:hasKey _:k1.
    
  _:k1 a rdf:List;
    rdf:rest _:k2;
    rdf:first <http://opencaesar.io/oml#hasSource> .
    
  _:k2 a rdf:List;
    rdf:rest rdf:nil;
    rdf:first <http://opencaesar.io/oml#hasTarget> .
```

5) Run:

```
.\gradlew --no-daemon owlReasonSimpleDescriptionTrig
```

6) inconsistency!

the cause is in /metrology-vocabularies/src/examples/oml/example.org/test-relation-entity-counter-examples.oml

```
  ri r1 : some-domain:Performs [ from c1 to f1, f2  some-domain:name "r1" ]
  ri r2 : some-domain:Performs [ from c1 to f1, f3  some-domain:name "r2" ]
```

The inconsistency is due to the key axiom:

```
# Individual: <http://example.org/test-relation-entity-counter-examples#r1> (<http://example.org/test-relation-entity-counter-examples#r1>)

ClassAssertion(<http://example.org/some-domain#Performs> <http://example.org/test-relation-entity-counter-examples#r1>)
ObjectPropertyAssertion(<http://opencaesar.io/oml#hasSource> <http://example.org/test-relation-entity-counter-examples#r1> <http://example.org/test-relation-entity-counter-examples#c1>)
ObjectPropertyAssertion(<http://opencaesar.io/oml#hasTarget> <http://example.org/test-relation-entity-counter-examples#r1> <http://example.org/test-relation-entity-counter-examples#f1>)
DataPropertyAssertion(<http://example.org/some-domain#name> <http://example.org/test-relation-entity-counter-examples#r1> "r1")

# Individual: <http://example.org/test-relation-entity-counter-examples#r2> (<http://example.org/test-relation-entity-counter-examples#r2>)

ClassAssertion(<http://example.org/some-domain#Performs> <http://example.org/test-relation-entity-counter-examples#r2>)
ObjectPropertyAssertion(<http://opencaesar.io/oml#hasSource> <http://example.org/test-relation-entity-counter-examples#r2> <http://example.org/test-relation-entity-counter-examples#c1>)
ObjectPropertyAssertion(<http://opencaesar.io/oml#hasTarget> <http://example.org/test-relation-entity-counter-examples#r2> <http://example.org/test-relation-entity-counter-examples#f1>)
DataPropertyAssertion(<http://example.org/some-domain#name> <http://example.org/test-relation-entity-counter-examples#r2> "r2")


DLSafeRule(Body(
  ObjectPropertyAtom(<http://opencaesar.io/oml#hasTarget> Variable(<x>) Variable(<z0>)) 
  ObjectPropertyAtom(<http://opencaesar.io/oml#hasTarget> Variable(<y>) Variable(<z0>)) 
  ObjectPropertyAtom(<http://opencaesar.io/oml#hasSource> Variable(<x>) Variable(<z1>)) 
  ObjectPropertyAtom(<http://opencaesar.io/oml#hasSource> Variable(<y>) Variable(<z1>)) 
  ClassAtom(<http://example.org/some-domain#Performs> Variable(<x>)) 
  ClassAtom(<http://example.org/some-domain#Performs> Variable(<y>)))
  Head(SameIndividualAtom(Variable(<x>) Variable(<y>))))
)
```

7) edit: /metrology-vocabularies/build/trig/example.org/test-relation-entity-counter-examples.trig

change:

```
  :r1 a owl:NamedIndividual, <http://example.org/some-domain#Performs>;
    <http://opencaesar.io/oml#hasSource> :c1;
    <http://opencaesar.io/oml#hasTarget> :f1, :f2;
    <http://example.org/some-domain#name> "r1" .
  
  :r2 a owl:NamedIndividual, <http://example.org/some-domain#Performs>;
    <http://opencaesar.io/oml#hasSource> :c1;
    <http://opencaesar.io/oml#hasTarget> :f1, :f3;
    <http://example.org/some-domain#name> "r2" .
```

to:

```
  :r1 a owl:NamedIndividual, <http://example.org/some-domain#Performs>;
    <http://opencaesar.io/oml#hasSource> :c1;
    <http://opencaesar.io/oml#hasTarget> :f1, :f2;
    <http://example.org/some-domain#name> "r1" .
  
  :r2 a owl:NamedIndividual, <http://example.org/some-domain#Performs>;
    <http://opencaesar.io/oml#hasSource> :c1;
    <http://opencaesar.io/oml#hasTarget> :f1, :f3;
    <http://example.org/some-domain#name> "r1" .
```

8) consistent!

9) Open the file: /metrology-vocabularies/build/trig/example.org/some-domain.trig

10) Replace the following:


```
  :IsPerformedBy a owl:Class;
    <http://purl.org/dc/elements/1.1/type> <http://opencaesar.io/oml#RelationEntity> .
    
  :Performs a owl:Class;
    <http://purl.org/dc/elements/1.1/type> <http://opencaesar.io/oml#RelationEntity> ;
    owl:hasKey _:k1.
    
  _:k1 a rdf:List;
    rdf:rest _:k2;
    rdf:first <http://opencaesar.io/oml#hasSource> .
    
  _:k2 a rdf:List;
    rdf:rest rdf:nil;
    rdf:first <http://opencaesar.io/oml#hasTarget> .
```

with:

```
  :IsPerformedBy a owl:Class;
    <http://purl.org/dc/elements/1.1/type> <http://opencaesar.io/oml#RelationEntity> ;
    rdfs:subClassOf _:is, _:it .
    
  _:is a owl:Restriction;
    owl:onClass :Function;
    owl:qualifiedCardinality "1"^^xsd:nonNegativeInteger;
    owl:onProperty <http://opencaesar.io/oml#hasSource> .
    
  _:it a owl:Restriction;
    owl:onClass :Component;
    owl:qualifiedCardinality "1"^^xsd:nonNegativeInteger;
    owl:onProperty <http://opencaesar.io/oml#hasTarget> .
  
  :Performs a owl:Class;
    <http://purl.org/dc/elements/1.1/type> <http://opencaesar.io/oml#RelationEntity> ;
    owl:hasKey _:k1  ;
    rdfs:subClassOf _:rs, _:rt .
    
  _:rs a owl:Restriction;
    owl:onClass :Component;
    owl:qualifiedCardinality "1"^^xsd:nonNegativeInteger;
    owl:onProperty <http://opencaesar.io/oml#hasSource> .
    
  _:rt a owl:Restriction;
    owl:onClass :Function;
    owl:qualifiedCardinality "1"^^xsd:nonNegativeInteger;
    owl:onProperty <http://opencaesar.io/oml#hasTarget> .
    
  _:k1 a rdf:List;
    rdf:rest _:k2;
    rdf:first <http://opencaesar.io/oml#hasSource> .
    
  _:k2 a rdf:List;
    rdf:rest rdf:nil;
    rdf:first <http://opencaesar.io/oml#hasTarget> .
    
```

11) Run:


```
.\gradlew --no-daemon owlReasonSimpleDescriptionTrig
```

12) inconsistent!

