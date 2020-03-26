Class {
	#name : #ButtonPart,
	#superclass : #WizardPart,
	#instVars : [
		'buttonLabel',
		'buttonEnabled'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
ButtonPart >> buttonEnabled [

	^ buttonEnabled 
]

{ #category : #accessing }
ButtonPart >> disable [

	buttonEnabled := false.
]

{ #category : #accessing }
ButtonPart >> enable [

	buttonEnabled := true.
]

{ #category : #initialization }
ButtonPart >> initialize [

	super initialize.
	buttonLabel := 'Default name'.
	buttonEnabled := true.
]

{ #category : #accessing }
ButtonPart >> label [

	^ buttonLabel 
]

{ #category : #accessing }
ButtonPart >> label: aString [

	buttonLabel := aString.
]

{ #category : #accessing }
ButtonPart >> latePopulateContents [
	
	|default|
	default := defaultValue meValue: self requiredInputs.
	default ifNotNil: [:aString |
		self label: aString
		]. 
	
]

{ #category : #rendering }
ButtonPart >> merlinRendering [ 

	^ self renderer merlinButtonRenderingFor: self  
]

{ #category : #'accessing - wizard management' }
ButtonPart >> outputValue [ 

	^ nil
]
