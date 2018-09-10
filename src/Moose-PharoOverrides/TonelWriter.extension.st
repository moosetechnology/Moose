Extension { #name : #TonelWriter }

{ #category : #'*Moose-PharoOverrides' }
TonelWriter >> typeTraitDefinitionOf: aClassDefinition [

	"Moose override: issue not opened"

	| definition |
	
	definition := OrderedDictionary new 
		at: #name put: aClassDefinition className; 
		yourself.

	aClassDefinition hasTraitComposition ifTrue: [ 
		definition		
			at: #traits 
			put: aClassDefinition traitCompositionString ].
		
	aClassDefinition hasClassTraitComposition ifTrue: [ 
		definition		
			at: #classTraits 
			put: aClassDefinition classTraitCompositionString ].

	(aClassDefinition variables select: #isInstanceVariable thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #instVars put: vars asArray ].

	(aClassDefinition variables select: #isClassInstanceVariable thenCollect: #name)
		ifNotEmpty: [ :vars | definition at: #classInstVars put: vars asArray ].
	
	definition at: #category put: aClassDefinition category.
		
	^ self toSTON: definition
]
