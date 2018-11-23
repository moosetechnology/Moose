Extension { #name : #RGClassStrategy }

{ #category : #'*Ring2-Monticello' }
RGClassStrategy >> asMCDefinition [

	^ MCClassDefinition 
		name: self owner name
		superclassName: (self owner superclass ifNil: [ 'nil' ] ifNotNil: [ :aSuperclass | aSuperclass name ])
		traitComposition: self owner traitCompositionString 
		classTraitComposition: self owner metaclass traitCompositionString
		category: self owner category 
		instVarNames: self instVarNames
		classVarNames: self owner classVarNames
		poolDictionaryNames: self owner sharedPoolNames
		classInstVarNames: self owner metaclass instVarNames
		type: self mcType
		comment: self owner comment content
		commentStamp: self owner comment stamp
]

{ #category : #'*Ring2-Monticello' }
RGClassStrategy >> classLayout [
	"TODO"
	^ layout"
		ifNil: [ 
			| superLayout scope |
			superLayout := superclass classLayout.
			scope := superLayout slotScope extend.
			layout := superLayout class extending: superLayout scope: scope host: self ]"
]

{ #category : #'*Ring2-Monticello' }
RGClassStrategy >> classPool [

	"TODO"
	^ Dictionary newFrom: (self classVarNames collect: [ :each | each -> nil ])
]

{ #category : #'*Ring2-Monticello' }
RGClassStrategy >> mcType [

	^ self layout mcType
]

{ #category : #'*Ring2-Monticello' }
RGClassStrategy >> referencedPackages [

	^ Array with: self package.
]
