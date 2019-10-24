Class {
	#name : #FMMetaMetaRepositoryTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #tests }
FMMetaMetaRepositoryTest >> testFM3 [
	| fm3 |
	fm3 := FMMetaMetaModel new.
	self assert: fm3 notNil.
	self assert: fm3 metamodel equals: fm3
]

{ #category : #tests }
FMMetaMetaRepositoryTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| repo names |
	repo := FMMetaMetaModel new.
	self assert: repo notNil.	"boot strapping FM3 does internally run the pragma processor"
	names := repo elements collect: [ :each | each fullName ].	"The package"
	self assert: (names includes: 'FM3').
	self
		assert: (repo elements detect: [ :el | el fullName = 'FM3.Class.package' ]) opposite
		equals: (repo elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).
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
