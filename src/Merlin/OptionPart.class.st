Class {
	#name : #OptionPart,
	#superclass : #WizardPart,
	#instVars : [
		'options',
		'optionsAndModels'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
OptionPart >> modelOfOption: anOption [

	^ self optionsAndModels at: anOption
]

{ #category : #accessing }
OptionPart >> options [
	
	^ options
]

{ #category : #accessing }
OptionPart >> options: aCollection [

	|tmpDictionary|
	tmpDictionary := IdentityDictionary new.
	options := (aCollection collect: [:each | each copy]).
	self options do: [:anObject |
		tmpDictionary at: anObject put: (MerlinOptionValueHolder new option: anObject; contents: true; addDependent: self; yourself)
		].
	self optionsAndModels: tmpDictionary
]

{ #category : #accessing }
OptionPart >> optionsAndModels [

	^ optionsAndModels 
]

{ #category : #accessing }
OptionPart >> optionsAndModels: aDictionary [

	optionsAndModels :=  aDictionary 
]
