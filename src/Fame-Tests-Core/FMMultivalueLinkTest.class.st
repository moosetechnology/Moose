Class {
	#name : #FMMultivalueLinkTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMMultivalueLinkTest >> testBookPerson [
	| book person |
	book := LIBBook new.
	person := LIBPerson new.
	self assert: book authors notNil.
	self assert: book authors isCollection.
	self assert: person books notNil.
	self assert: person books isCollection.
	book authors add: person.
	self assert: book authors size equals: 1.
	self assert: book authors anyOne equals: person.
	self assert: person books size equals: 1.
	self assert: person books anyOne equals: book
]

{ #category : #running }
FMMultivalueLinkTest >> testClassPackage [
	| package meta |
	package := FM3PackageDescription new.
	meta := FM3MetaDescription new.
	self assert: package classes notNil.
	self assert: package classes isCollection.
	self assert: meta package isNil.
	meta package: package.
	self assert: package classes size equals: 1.
	self assert: package classes anyOne equals: meta.
	self assert: meta package equals: package
]

{ #category : #running }
FMMultivalueLinkTest >> testClassProperty [
	| meta prop |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	self assert: meta attributes notNil.
	self assert: meta attributes isCollection.
	self assert: prop mmClass isNil.
	meta attributes add: prop.
	self assert: meta attributes size equals: 1.
	self assert: meta attributes anyOne equals: prop.
	self assert: prop mmClass equals: meta
]

{ #category : #running }
FMMultivalueLinkTest >> testFM3Classes [
	| fm3 |
	fm3 := FMMetaRepository fm3.
	self assert: (fm3 descriptionOf: FM3Element) notNil.
	self assert: (fm3 descriptionOf: FM3PropertyDescription) notNil.
	self assert: (fm3 descriptionOf: FM3PackageDescription) notNil.
	self assert: (fm3 descriptionOf: FM3MetaDescription) notNil.
	self assert: (fm3 descriptionOf: FMMetaRepositoryTest) isNil
	"	self should: [ fm3 descriptionOf: FMMetaRepositoryTest ] raise: Error"
]

{ #category : #'running collection' }
FMMultivalueLinkTest >> testIntersection [
	[ FM3MetaDescription new attributes intersection: #() ] should not raise: Error
]

{ #category : #running }
FMMultivalueLinkTest >> testMenageATrois [
	| me you her |
	me := FM3PropertyDescription new.
	you := FM3PropertyDescription new.
	her := FM3PropertyDescription new.
	self assert: me opposite isNil.
	self assert: you opposite isNil.
	self assert: her opposite isNil.
	me opposite: you.
	self assert: me opposite equals: you.
	self assert: you opposite equals: me.
	self assert: her opposite isNil.
	me opposite: her.
	self assert: me opposite equals: her.
	self assert: you opposite isNil.
	self assert: her opposite equals: me
]

{ #category : #running }
FMMultivalueLinkTest >> testOpposite [
	| opposite prop |
	opposite := FM3PropertyDescription new.
	prop := FM3PropertyDescription new.
	self assert: opposite opposite isNil.
	self assert: prop opposite isNil.
	prop opposite: opposite.
	self assert: opposite opposite equals: prop.
	self assert: prop opposite equals: opposite
]

{ #category : #running }
FMMultivalueLinkTest >> testPackageClass [
	| package meta |
	package := FM3PackageDescription new.
	meta := FM3MetaDescription new.
	self assert: package classes notNil.
	self assert: package classes isCollection.
	self assert: meta package isNil.
	package classes add: meta.
	self assert: package classes size equals: 1.
	self assert: package classes anyOne equals: meta.
	self assert: meta package equals: package
]

{ #category : #running }
FMMultivalueLinkTest >> testPackageProperty [
	| package prop |
	package := FM3PackageDescription new.
	prop := FM3PropertyDescription new.
	self assert: package extensions notNil.
	self assert: package extensions isCollection.
	self assert: prop package isNil.
	package extensions add: prop.
	self assert: package extensions size equals: 1.
	self assert: package extensions anyOne equals: prop.
	self assert: prop package equals: package
]

{ #category : #running }
FMMultivalueLinkTest >> testPersonBook [
	| book person |
	book := LIBBook new.
	person := LIBPerson new.
	self assert: book authors notNil.
	self assert: book authors isCollection.
	self assert: person books notNil.
	self assert: person books isCollection.
	person books add: book.
	self assert: book authors size equals: 1.
	self assert: book authors anyOne equals: person.
	self assert: person books size equals: 1.
	self assert: person books anyOne equals: book
]

{ #category : #running }
FMMultivalueLinkTest >> testPropertyClass [
	| meta prop |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	self assert: meta attributes notNil.
	self assert: meta attributes isCollection.
	self assert: prop mmClass isNil.
	prop mmClass: meta.
	self assert: meta attributes size equals: 1.
	self assert: meta attributes anyOne equals: prop.
	self assert: prop mmClass equals: meta
]

{ #category : #running }
FMMultivalueLinkTest >> testPropertyPackage [
	| package prop |
	package := FM3PackageDescription new.
	prop := FM3PropertyDescription new.
	self assert: package extensions notNil.
	self assert: package extensions isCollection.
	self assert: prop package isNil.
	prop package: package.
	self assert: package extensions size equals: 1.
	self assert: package extensions anyOne equals: prop.
	self assert: prop package equals: package
]

{ #category : #'running collection' }
FMMultivalueLinkTest >> testUnion [
	[ FM3MetaDescription new attributes union: #() ] should not raise: Error
]

{ #category : #running }
FMMultivalueLinkTest >> testUnsetOpposite [
	| opposite prop |
	opposite := FM3PropertyDescription new.
	prop := FM3PropertyDescription new.
	self assert: opposite opposite isNil.
	self assert: prop opposite isNil.
	prop opposite: opposite.
	opposite opposite: nil.
	self assert: opposite opposite isNil.
	self assert: prop opposite isNil
]
