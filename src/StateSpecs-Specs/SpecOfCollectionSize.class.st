"
I describe collections of particular size.

	#(1 2) should haveSize: 2

My instances can be created by: 

	SpecOfCollectionSize requiredSize: 2

Internal Representation and Key Implementation Points.
	
    Instance Variables
	requiredSize:		<Integer>
"
Class {
	#name : #SpecOfCollectionSize,
	#superclass : #SpecOfCollection,
	#instVars : [
		'requiredSize'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfCollectionSize class >> requiredSize: anInteger [ 
	^self new requiredSize: anInteger
]

{ #category : #testing }
SpecOfCollectionSize >> basicMatches: aCollection [ 
	^aCollection size = requiredSize
]

{ #category : #displaying }
SpecOfCollectionSize >> defaultTitle [
	^'have ' , requiredSize printString , ' elements'
]

{ #category : #accessing }
SpecOfCollectionSize >> requiredSize [
	^requiredSize
]

{ #category : #accessing }
SpecOfCollectionSize >> requiredSize: anInteger [ 
	requiredSize := anInteger
]

{ #category : #accessing }
SpecOfCollectionSize >> requiredValue [
	^requiredSize
]
