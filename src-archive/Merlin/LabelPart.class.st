Class {
	#name : #LabelPart,
	#superclass : #WizardPart,
	#category : #'Merlin-ToBeRemoved'
}

{ #category : #'instance creation' }
LabelPart class >> on: stringText [

	^ super new initializeWith: stringText .
]

{ #category : #'instance creation' }
LabelPart class >> on: stringText inGroupBoxNamed: groupBoxName [

	^ super new initializeWith: stringText inGroupBoxNamed: groupBoxName ; yourself .
]

{ #category : #'initialize-release' }
LabelPart >> initializeWith: stringText [

	"self contents: {self newLabel: stringText }"
	self populateContents: {self newLabel: stringText }
]

{ #category : #'initialize-release' }
LabelPart >> initializeWith: stringText inGroupBoxNamed: groupBoxName [

	self populateContents: {self newGroupboxNamed: groupBoxName  With: (self newLabel: stringText) }
]

{ #category : #'accessing - wizard mangement' }
LabelPart >> outputValue [

	^ nil


]
