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
	book authors notNil should beTrue.
	book authors isCollection should beTrue.
	person books notNil should beTrue.
	person books isCollection should beTrue.
	book authors add: person.
	book authors size should = 1.
	book authors anyOne should = person.
	person books size should = 1.
	person books anyOne should = book
]

{ #category : #running }
FMMultivalueLinkTest >> testClassPackage [
	| package meta |
	package := FM3PackageDescription new.
	meta := FM3MetaDescription new.
	package classes notNil should beTrue.
	package classes isCollection should beTrue.
	meta package isNil should beTrue.
	meta package: package.
	package classes size should = 1.
	package classes anyOne should = meta.
	meta package should = package
]

{ #category : #running }
FMMultivalueLinkTest >> testClassProperty [
	| meta prop |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	meta attributes notNil should beTrue.
	meta attributes isCollection should beTrue.
	prop mmClass isNil should beTrue.
	meta attributes add: prop.
	meta attributes size should = 1.
	meta attributes anyOne should = prop.
	prop mmClass should = meta
]

{ #category : #running }
FMMultivalueLinkTest >> testFM3Classes [
	| fm3 |
	fm3 := FMMetaRepository fm3.
	(fm3 descriptionOf: FM3Element) notNil should beTrue.
	(fm3 descriptionOf: FM3PropertyDescription) notNil should beTrue.
	(fm3 descriptionOf: FM3PackageDescription) notNil should beTrue.
	(fm3 descriptionOf: FM3MetaDescription) notNil should beTrue.
	(fm3 descriptionOf: FMMetaRepositoryTest) isNil should beTrue.
"	self should: [ fm3 descriptionOf: FMMetaRepositoryTest ] raise: Error"
]

{ #category : #'running collection' }
FMMultivalueLinkTest >> testIntersection [
	[FM3MetaDescription new attributes intersection: #()] should not signal: Error
]

{ #category : #running }
FMMultivalueLinkTest >> testMenageATrois [
	| me you her |
	me := FM3PropertyDescription new.
	you := FM3PropertyDescription new.
	her := FM3PropertyDescription new.
	me opposite isNil should beTrue.
	you opposite isNil should beTrue.
	her opposite isNil should beTrue.
	me opposite: you.
	me opposite should = you.
	you opposite should = me.
	her opposite isNil should beTrue.
	me opposite: her.
	me opposite should = her.
	you opposite isNil should beTrue.
	her opposite should = me
]

{ #category : #running }
FMMultivalueLinkTest >> testOpposite [
	| opposite prop |
	opposite := FM3PropertyDescription new.
	prop := FM3PropertyDescription new.
	opposite opposite isNil should beTrue.
	prop opposite isNil should beTrue.
	prop opposite: opposite.
	opposite opposite should = prop.
	prop opposite should = opposite
]

{ #category : #running }
FMMultivalueLinkTest >> testPackageClass [
	| package meta |
	package := FM3PackageDescription new.
	meta := FM3MetaDescription new.
	package classes notNil should beTrue.
	package classes isCollection should beTrue.
	meta package isNil should beTrue.
	package classes add: meta.
	package classes size should = 1.
	package classes anyOne should = meta.
	meta package should = package
]

{ #category : #running }
FMMultivalueLinkTest >> testPackageProperty [
	| package prop |
	package := FM3PackageDescription new.
	prop := FM3PropertyDescription new.
	package extensions notNil should beTrue.
	package extensions isCollection should beTrue.
	prop package isNil should beTrue.
	package extensions add: prop.
	package extensions size should = 1.
	package extensions anyOne should = prop.
	prop package should = package
]

{ #category : #running }
FMMultivalueLinkTest >> testPersonBook [
	| book person |
	book := LIBBook new.
	person := LIBPerson new.
	book authors notNil should beTrue.
	book authors isCollection should beTrue.
	person books notNil should beTrue.
	person books isCollection should beTrue.
	person books add: book.
	book authors size should = 1.
	book authors anyOne should = person.
	person books size should = 1.
	person books anyOne should = book
]

{ #category : #running }
FMMultivalueLinkTest >> testPropertyClass [
	| meta prop |
	meta := FM3MetaDescription new.
	prop := FM3PropertyDescription new.
	meta attributes notNil should beTrue.
	meta attributes isCollection should beTrue.
	prop mmClass isNil should beTrue.
	prop mmClass: meta.
	meta attributes size should = 1.
	meta attributes anyOne should = prop.
	prop mmClass should = meta
]

{ #category : #running }
FMMultivalueLinkTest >> testPropertyPackage [
	| package prop |
	package := FM3PackageDescription new.
	prop := FM3PropertyDescription new.
	package extensions notNil should beTrue.
	package extensions isCollection should beTrue.
	prop package isNil should beTrue.
	prop package: package.
	package extensions size should = 1.
	package extensions anyOne should = prop.
	prop package should = package
]

{ #category : #'running collection' }
FMMultivalueLinkTest >> testUnion [
	[FM3MetaDescription new attributes union: #()] should not signal: Error
]

{ #category : #running }
FMMultivalueLinkTest >> testUnsetOpposite [
	| opposite prop |
	opposite := FM3PropertyDescription new.
	prop := FM3PropertyDescription new.
	opposite opposite isNil should beTrue.
	prop opposite isNil should beTrue.
	prop opposite: opposite.
	opposite opposite: nil.
	opposite opposite isNil should beTrue.
	prop opposite isNil should beTrue
]
