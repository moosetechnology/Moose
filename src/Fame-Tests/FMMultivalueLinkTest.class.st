Class {
	#name : #FMMultivalueLinkTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #tests }
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

{ #category : #tests }
FMMultivalueLinkTest >> testClassPackage [
	| package meta |
	package := FM3Package new.
	meta := FM3Class new.
	self assert: package classes notNil.
	self assert: package classes isCollection.
	self assert: meta package isNil.
	meta package: package.
	self assert: package classes size equals: 1.
	self assert: package classes anyOne equals: meta.
	self assert: meta package equals: package
]

{ #category : #tests }
FMMultivalueLinkTest >> testClassProperty [
	| meta prop |
	meta := FM3Class new.
	prop := FM3Property new.
	self assert: meta properties notNil.
	self assert: meta properties isCollection.
	self assert: prop mmClass isNil.
	meta properties add: prop.
	self assert: meta properties size equals: 1.
	self assert: meta properties anyOne equals: prop.
	self assert: prop mmClass equals: meta
]

{ #category : #tests }
FMMultivalueLinkTest >> testIntersection [
	self shouldnt: [ FM3Class new properties intersection: #() ] raise: Error
]

{ #category : #tests }
FMMultivalueLinkTest >> testMenageATrois [
	| me you her |
	me := FM3Property new.
	you := FM3Property new.
	her := FM3Property new.
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

{ #category : #tests }
FMMultivalueLinkTest >> testOpposite [
	| opposite prop |
	opposite := FM3Property new.
	prop := FM3Property new.
	self assert: opposite opposite isNil.
	self assert: prop opposite isNil.
	prop opposite: opposite.
	self assert: opposite opposite equals: prop.
	self assert: prop opposite equals: opposite
]

{ #category : #tests }
FMMultivalueLinkTest >> testPackageClass [
	| package meta |
	package := FM3Package new.
	meta := FM3Class new.
	self assert: package classes notNil.
	self assert: package classes isCollection.
	self assert: meta package isNil.
	package classes add: meta.
	self assert: package classes size equals: 1.
	self assert: package classes anyOne equals: meta.
	self assert: meta package equals: package
]

{ #category : #tests }
FMMultivalueLinkTest >> testPackageProperty [
	| package prop |
	package := FM3Package new.
	prop := FM3Property new.
	self assert: package extensions notNil.
	self assert: package extensions isCollection.
	self assert: prop package isNil.
	package extensions add: prop.
	self assert: package extensions size equals: 1.
	self assert: package extensions anyOne equals: prop.
	self assert: prop package equals: package
]

{ #category : #tests }
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

{ #category : #tests }
FMMultivalueLinkTest >> testPropertyClass [
	| meta prop |
	meta := FM3Class new.
	prop := FM3Property new.
	self assert: meta properties notNil.
	self assert: meta properties isCollection.
	self assert: prop mmClass isNil.
	prop mmClass: meta.
	self assert: meta properties size equals: 1.
	self assert: meta properties anyOne equals: prop.
	self assert: prop mmClass equals: meta
]

{ #category : #tests }
FMMultivalueLinkTest >> testPropertyPackage [
	| package prop |
	package := FM3Package new.
	prop := FM3Property new.
	self assert: package extensions notNil.
	self assert: package extensions isCollection.
	self assert: prop package isNil.
	prop package: package.
	self assert: package extensions size equals: 1.
	self assert: package extensions anyOne equals: prop.
	self assert: prop package equals: package
]

{ #category : #tests }
FMMultivalueLinkTest >> testUnion [
	self shouldnt: [ FM3Class new properties union: #() ] raise: Error
]

{ #category : #tests }
FMMultivalueLinkTest >> testUnsetOpposite [
	| opposite prop |
	opposite := FM3Property new.
	prop := FM3Property new.
	self assert: opposite opposite isNil.
	self assert: prop opposite isNil.
	prop opposite: opposite.
	opposite opposite: nil.
	self assert: opposite opposite isNil.
	self assert: prop opposite isNil
]
