Extension { #name : #TonelParser }

{ #category : #'*Moose-PharoOverrides' }
TonelParser >> newTraitDefinitionFrom: anArray [

	"Moose override: issue not opened"

	| metadata traitDefs |
	metadata := anArray sixth.
	
	traitDefs := { 
		MCTraitDefinition
			name: (metadata at: #name)
			traitComposition: (metadata at: #traits ifAbsent: [ '{}' ])
			category: (metadata at: #category)
			instVarNames: (metadata at: #instVars ifAbsent: [ #() ])
			classInstVarNames: (metadata at: 'classInstVars' ifAbsent: [ #() ])
			comment: (anArray second ifNil: [ '' ])
			commentStamp: nil }.
			
	metadata 
		at: #classTraits
		ifPresent: [ :classTraits |
			traitDefs := traitDefs copyWith: (MCClassTraitDefinition
 				baseTraitName: (metadata at: #name)
 				classTraitComposition: classTraits
				category: (metadata at: #category)) ].
		
	^ traitDefs
]
