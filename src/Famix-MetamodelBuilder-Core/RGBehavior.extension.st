Extension { #name : #RGBehavior }

{ #category : #'*Famix-MetamodelBuilder-Core' }
RGBehavior >> dependsOn: anotherBehavior [

	(self allSuperclasses includes: anotherBehavior) ifTrue: [ ^ true ].
	
	((self withAllSuperclasses flatCollect: [:each | each traitComposition traits]) includes: anotherBehavior) ifTrue: [ ^ true ].
	
	^ false	
]

{ #category : #'*Famix-MetamodelBuilder-Core' }
RGBehavior >> traitsDefinitions [
	| methodsToRemoveMap traitCompositionString precedingTrait |
	methodsToRemoveMap := self propertyNamed: #methodsToRemoveFromTraitComposition ifAbsent: [ Dictionary new ].
	traitCompositionString := self traitComposition transformations
		collect: [ :trait | 
			methodsToRemoveMap
				at: trait name
				ifPresent: [ :methods | 
					String
						streamContents: [ :s | 
							s
								nextPutAll: trait asString;
								nextPutAll: ' - '.
							methods sorted printAsSelfEvaluatingFormOn: s ] ]
				ifAbsent: [ trait asString ] ].
	
	precedingTrait := self propertyNamed: #precedingTrait ifAbsent: [ ^ traitCompositionString ].
	
	^ String streamContents: [ :s | s nextPutAll: '(( ' ; 
			nextPutAll: traitCompositionString ; 
			nextPutAll: ' withPrecedenceOf: '; nextPutAll: precedingTrait; nextPutAll: ' )' ].
	
]
