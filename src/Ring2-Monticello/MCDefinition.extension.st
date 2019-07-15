Extension { #name : #MCDefinition }

{ #category : #'*Ring2-Monticello' }
MCDefinition >> authorForStamp: stamp [
	
	^ stamp isEmptyOrNil
		ifTrue: [ '<historical>']
		ifFalse: [ stamp substrings first].
]

{ #category : #'*Ring2-Monticello' }
MCDefinition >> ensureRingDefinitionIn: anRGEnvironment [

	"do nothing by default"
]

{ #category : #'*Ring2-Monticello' }
MCDefinition >> ensureRingDefinitionIn: anRGEnvironment package: anRGPackageDefinition [
	
	"by default do not set the package"

	^ self ensureRingDefinitionIn: anRGEnvironment.
	
]

{ #category : #'*Ring2-Monticello' }
MCDefinition >> timeForStamp: stamp [

	^ stamp
		ifNil: [ 	DateAndTime new]
		ifNotNil: [ 
			| substrings |
			substrings := stamp substrings.
			([(DateAndTime fromString: (' ' join: substrings allButFirst ))] on: Exception do: [DateAndTime epoch]) ]. 
	
]

{ #category : #'*Ring2-Monticello' }
MCDefinition >> traitCompositionFrom: aStringOrNil parent: aBehavior [
	
	| composition transformations |
	
	composition := RGTraitComposition parent: aBehavior.

	aStringOrNil ifNil: [ ^ composition ].

	transformations := RGTraitCompositionVisitor new parse: aStringOrNil for: composition.
	transformations do: [ :each |
		composition addTransformation: each ].
	^ composition
]
