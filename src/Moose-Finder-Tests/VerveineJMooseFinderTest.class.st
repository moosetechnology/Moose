Class {
	#name : #VerveineJMooseFinderTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Finder-Tests'
}

{ #category : #accessing }
VerveineJMooseFinderTest class >> resources [
	^ Array with: LANPackageTestResource
]

{ #category : #running }
VerveineJMooseFinderTest >> buildModel [ 
	model := VerveineJTestResource current model
]
