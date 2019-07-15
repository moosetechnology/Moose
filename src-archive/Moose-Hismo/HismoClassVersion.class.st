Class {
	#name : #HismoClassVersion,
	#superclass : #HismoEntityVersion,
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoClassVersion class >> annotation [
	<MSEClass: #ClassVersion super: #HismoEntityVersion>
	<package: #Hismo>
]

{ #category : #properties }
HismoClassVersion >> additionOfNumberOfMethods [
	
"	<property: #VANOM longName: 'Version addition of number of methods'
		description: 'Version addition of number of methods'>"

	<MSEProperty: #additionOfNumberOfMethods type: #Number>
	<MSEComment: 'Version addition of number of methods'>	
	
	^self additionOfPropertyNamed: #additionOfNumberOfMethods
]

{ #category : #properties }
HismoClassVersion >> evolutionOfCyclomaticComplexity [
	<MSEProperty: #evolutionOfCyclomaticComplexity type: #Number>
	<MSEComment:  'Version evolution of number of cyclomatic complexity'>
	
	"Check: CyclomaticComplexity is not applied to classes, just to methods"	
	
	^self evolutionOfPropertyNamed: #evolutionOfCyclomaticComplexity
]

{ #category : #properties }
HismoClassVersion >> evolutionOfNumberOfMethods [
	
"	<property: #VENOM longName: 'Version evolution of number of methods'
		description: 'Version evolution of number of methods'>"

	<MSEProperty: #evolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'Version evolution of number of methods'>	

	^self evolutionOfPropertyNamed: #evolutionOfNumberOfMethods
]

{ #category : #properties }
HismoClassVersion >> evolutionOfNumberOfStatements [
	
"	<property: #VENOS longName: 'Version evolution of number of statements'
		description: 'Version evolution of number of statements'>"

	<MSEProperty: #evolutionOfNumberOfStatements type: #Number>
	<MSEComment: 'Version evolution of number of statements'>	

	^self evolutionOfPropertyNamed: #evolutionOfNumberOfStatements
]
