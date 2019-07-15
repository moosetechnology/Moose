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
