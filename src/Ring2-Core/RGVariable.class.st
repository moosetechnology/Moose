"
A variable definition
"
Class {
	#name : #RGVariable,
	#superclass : #RGElement,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #testing }
RGVariable >> isClassInstanceVariable [

	^false
]

{ #category : #testing }
RGVariable >> isClassVariable [

	^false
]

{ #category : #testing }
RGVariable >> isPoolVariable [

	^false
]

{ #category : #testing }
RGVariable >> isSpecial [

	^ false
]

{ #category : #testing }
RGVariable >> isVariableDefinition [

	^ true
]

{ #category : #accessing }
RGVariable >> name: aString [

	self parent announceDefinitionChangeDuring: [ 
		super name: aString ].

]
