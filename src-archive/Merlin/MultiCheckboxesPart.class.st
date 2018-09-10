Class {
	#name : #MultiCheckboxesPart,
	#superclass : #MultipleOptionPart,
	#instVars : [
		'checkboxParts',
		'answer',
		'labels',
		'formatBlock'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'instance creation' }
MultiCheckboxesPart class >> withAll: aCollectionOfLabels [ 

	^ super new initialize: aCollectionOfLabels .
]

{ #category : #accessing }
MultiCheckboxesPart >> format: aBlock [

	"use this method the string representationof the options. aBlock is a one argument block (representing the current option to format). It should return a string that will be the representation of the option"
	formatBlock := aBlock
]

{ #category : #accessing }
MultiCheckboxesPart >> formatBlock [

	^ formatBlock ifNil: [formatBlock := [:option | option ]]
]

{ #category : #accessing }
MultiCheckboxesPart >> initializeFromLabels: aCollectionOfString [

	self labels: aCollectionOfString 
]

{ #category : #accessing }
MultiCheckboxesPart >> labels [ 

	^ self options
]

{ #category : #accessing }
MultiCheckboxesPart >> labels: aCollectionOfString [

	self options: aCollectionOfString
]

{ #category : #accessing }
MultiCheckboxesPart >> latePopulateContents [ 

	
]

{ #category : #'*merlin-rendering' }
MultiCheckboxesPart >> merlinRendering [

	^ self renderer merlinMultiCheckboxesRenderingFor: self
]

{ #category : #'accessing - wizard mangement' }
MultiCheckboxesPart >> outputValue [

	|tmpResult|
	tmpResult := OrderedCollection new.
	self optionsAndModels keysAndValuesDo: [:aLabel :aModel | 
		tmpResult add: (aLabel ->aModel contents)
		].
	^ tmpResult
]

{ #category : #'accessing - wizard mangement' }
MultiCheckboxesPart >> selectedItems [

	"return a collection containing symbols corresponding to the checkboxes selected"
	| result |
	result := OrderedCollection new.
	self optionsAndModels keysAndValuesDo:  [ :anOption :aModel | aModel contents ifTrue: [ result add: anOption asSymbol ] ].
	^ result
]
