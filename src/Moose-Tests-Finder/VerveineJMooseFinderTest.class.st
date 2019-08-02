Class {
	#name : #VerveineJMooseFinderTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Tests-Finder'
}

{ #category : #accessing }
VerveineJMooseFinderTest class >> resources [
	^ Array with: LANPackageTestResource
]

{ #category : #running }
VerveineJMooseFinderTest >> buildModel [ 
	model := VerveineJTestResource current model
]

{ #category : #tests }
VerveineJMooseFinderTest >> testDelete [

	"Raise an error since it is not in the root"
	self should: [[FamixJavaMooseModel new delete] valueSupplyingAnswer: true ] raise: Error.
	
	model := FamixJavaMooseModel new.
	self deny: (FamixJavaMooseModel root includes: model).
	FamixJavaMooseModel root add: model.
	self assert: (FamixJavaMooseModel root includes: model).

	[model delete] valueSupplyingAnswer: {'Are you sure to want to delete ', model mooseName printString, '?' . true}.
	self deny: (FamixJavaMooseModel root includes: model).

]
