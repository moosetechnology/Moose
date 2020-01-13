Class {
	#name : #FMMetaMetaModelTest,
	#superclass : #TestCase,
	#instVars : [
		'metaMetaModel'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMMetaMetaModelTest >> setUp [
	super setUp.
	metaMetaModel := FMMetaMetaModel default
]

{ #category : #tests }
FMMetaMetaModelTest >> testFM3 [
	self assert: metaMetaModel isNotNil
]

{ #category : #tests }
FMMetaMetaModelTest >> testFM3Classes [
	self assert: (metaMetaModel descriptionOf: FM3Element ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FM3Property ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FM3Package ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FM3Class ifAbsent: [ nil ]) isNotNil.
	self assert: (metaMetaModel descriptionOf: FMMetaModelTest ifAbsent: [ nil ]) isNil
]

{ #category : #tests }
FMMetaMetaModelTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| names |
	self assert: metaMetaModel isNotNil.	"boot strapping FM3 does internally run the pragma processor"
	names := metaMetaModel elements collect: [ :each | each fullName ].	"The package"
	self assert: (names includes: 'FM3').
	self
		assert: (metaMetaModel elements detect: [ :el | el fullName = 'FM3.Class.package' ]) opposite
		equals: (metaMetaModel elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).
	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
	self assert: (names includes: 'FM3.Element').
	self assert: (names includes: 'FM3.Element.name').
	self assert: (names includes: 'FM3.Element.fullName').
	self assert: (names includes: 'FM3.Element.owner').
	self assert: (names includes: 'FM3.Class').
	self assert: (names includes: 'FM3.Class.abstract').
	self assert: (names includes: 'FM3.Class.primitive').
	self assert: (names includes: 'FM3.Class.root').
	self assert: (names includes: 'FM3.Class.superclass').
	self assert: (names includes: 'FM3.Class.subclasses').
	self assert: (names includes: 'FM3.Class.traits').
	self assert: (names includes: 'FM3.Class.package').
	self assert: (names includes: 'FM3.Class.allProperties').
	self assert: (names includes: 'FM3.Class.properties').
	self assert: (names includes: 'FM3.Property').
	self assert: (names includes: 'FM3.Property.composite').
	self assert: (names includes: 'FM3.Property.container').
	self assert: (names includes: 'FM3.Property.derived').
	self assert: (names includes: 'FM3.Property.multivalued').
	self assert: (names includes: 'FM3.Property.class').
	self assert: (names includes: 'FM3.Property.package').
	self assert: (names includes: 'FM3.Property.type').
	self assert: (names includes: 'FM3.Property.opposite').
	self assert: (names includes: 'FM3.Package').
	self assert: (names includes: 'FM3.Package.extensions').
	self assert: (names includes: 'FM3.Package.classes').
	self assert: names size equals: 27.
	self assert: (names select: [ :n | n beginsWith: 'FM3.' ]) size equals: 26
]

{ #category : #tests }
FMMetaMetaModelTest >> testMetaMetaModelIsItsOwnMetaModel [
	self assert: metaMetaModel metamodel identicalTo: metaMetaModel
]
