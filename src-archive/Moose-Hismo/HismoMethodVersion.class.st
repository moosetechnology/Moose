Class {
	#name : #HismoMethodVersion,
	#superclass : #HismoEntityVersion,
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoMethodVersion class >> annotation [
	<MSEClass: #MethodVersion super: #HismoEntityVersion>
	<package: #Hismo>
]

{ #category : #versions }
HismoMethodVersion >> additionOfCyclomaticComplexity [
	<MSEProperty: #additionOfCyclomaticComplexity type: #Number>
	<MSEComment: 'Version addition of number of methods'>	

	^self additionOfPropertyNamed: #additionOfCyclomaticComplexity
]

{ #category : #versions }
HismoMethodVersion >> evolutionOfCyclomaticComplexity [
	<MSEProperty: #evolutionOfCyclomaticComplexity type: #Number>
	<MSEComment: 'Version addition of number of methods'>

	^self evolutionOfPropertyNamed: #evolutionOfCyclomaticComplexity
]

{ #category : #versions }
HismoMethodVersion >> evolutionOfNumberOfStatements [
	<MSEProperty: #evolutionOfNumberOfStatements type: #Number>
	<MSEComment: 'Version addition of number of methods'>

	^self evolutionOfPropertyNamed: #evolutionOfNumberOfStatements
]
