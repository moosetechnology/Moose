Class {
	#name : #TextPart,
	#superclass : #WizardPart,
	#instVars : [
		'text',
		'partValue',
		'formatBlock'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'instance creation' }
TextPart class >> on: blockOrStringText inGroupBoxNamed: groupBoxName [

	^ super new defaultValue: blockOrStringText; inGroupboxNamed: groupBoxName;yourself. 
]

{ #category : #accessing }
TextPart >> format: aBlock [
	"set to a block to make the input object more presentable"
	formatBlock := aBlock
]

{ #category : #accessing }
TextPart >> formatBlock [
	^ formatBlock ifNil: [formatBlock := [:option | option ]]
]

{ #category : #private }
TextPart >> latePopulateContents [
	partValue
		ifNil: [ | default |
			default := defaultValue meValue: self requiredInputs.
			default ifNotNil: [ self text: default ] ]
		ifNotNil: [ partValue isBlock ifTrue: [ self text: (partValue value: self requiredInputs) ] ifFalse: [ self text: partValue ] ]
]

{ #category : #rendering }
TextPart >> merlinRendering [

	^ self renderer merlinTextRenderingFor: self.
]

{ #category : #'accessing - wizard mangement' }
TextPart >> outputValue [ 

	^ self text
]

{ #category : #accessing }
TextPart >> text [ 

	^ text ifNil: ['']
]

{ #category : #accessing }
TextPart >> text: aString [
	
	text := aString.
]
