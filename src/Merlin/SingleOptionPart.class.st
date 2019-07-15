Class {
	#name : #SingleOptionPart,
	#superclass : #OptionPart,
	#instVars : [
		'selectedOption',
		'formatBlock'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'accessing - wizard management' }
SingleOptionPart >> format: aBlock [

	"use this method the string representationof the options. aBlock is a one argument block (representing the current option to format). It should return a string that will be the representation of the option"
	formatBlock := aBlock
]

{ #category : #'accessing - wizard management' }
SingleOptionPart >> formatBlock [

	^ formatBlock ifNil: [formatBlock := [:option | option ]]
]

{ #category : #'accessing - wizard management' }
SingleOptionPart >> outputValue [

	^ self selectedOption  
]

{ #category : #accessing }
SingleOptionPart >> selectOption: anOption [

	self optionsAndModels keysAndValuesDo: [:tmpOption :aModel |
		tmpOption = anOption 
			ifTrue: [
				aModel safeContents: true.
				self selectedOption: anOption  
				]
			ifFalse: [
				aModel safeContents: false
				] 
		]  
]

{ #category : #accessing }
SingleOptionPart >> selectedOption [

	^ selectedOption
]

{ #category : #accessing }
SingleOptionPart >> selectedOption: anOption [

	selectedOption := anOption.
	self hasChanged
]

{ #category : #accessing }
SingleOptionPart >> unselectOption: anOption [

	self selectedOption: nil.
	self hasChanged.    
]

{ #category : #updating }
SingleOptionPart >> update: aChange [

	(self options includes: aChange) ifTrue: [
		(self modelOfOption: aChange) contents 
			ifTrue: [self selectOption: aChange]
			ifFalse: [self unselectOption: aChange]   
		]
]
