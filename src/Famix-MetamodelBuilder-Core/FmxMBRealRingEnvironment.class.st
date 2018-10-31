Class {
	#name : #FmxMBRealRingEnvironment,
	#superclass : #FmxMBRingEnvironment,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #installing }
FmxMBRealRingEnvironment >> adoptClassCommentOf: realClass to: anRGClass [
	
	anRGClass comment content isEmptyOrNil
		ifFalse: [ realClass comment: anRGClass comment content ]
]

{ #category : #installing }
FmxMBRealRingEnvironment >> adoptClassDefinitionOf: realClass to: anRGClass [
	| generatedOldSlots customSlots customTraits customTraitNames customSlotNames slotDefinitions slotsString definition generatedOldTraits traitsDefinitions traitsString |


	generatedOldSlots := self generatedSlotsOf: realClass.
	generatedOldTraits := self generatedTraitNamessOf: realClass.
	customSlots := realClass localSlots copyWithoutAll: generatedOldSlots.
	customTraits := realClass traitComposition members reject: [ :e | generatedOldTraits includes: e name].
	customSlotNames := customSlots collect: #name.
	customTraitNames := customTraits collect: #traitCompositionExpression.
	slotDefinitions := ((anRGClass slots
		reject: [ :each | customSlotNames includes: each name ])
		collect: #definitionString) asOrderedCollection.
	traitsDefinitions := (anRGClass traitComposition transformations collect: #asString), 
		customTraitNames.
	slotDefinitions addAll: (customSlots collect: #definitionString).
	slotDefinitions := slotDefinitions sorted.
	
	slotsString := '{' , (slotDefinitions joinUsing: '. ') , '}'.
	traitsString := traitsDefinitions 
		ifEmpty: [ '{ }' ]
		ifNotEmpty: [ traitsDefinitions joinUsing: ' + '. ].
	anRGClass isTrait ifFalse: [ 
	definition := '{superclass} subclass: #{className} 
		uses: {traits} 
		slots: {slots} 
		classVariables: {classVariables}
		poolDictionaries: ''{poolDictionaries}''
		category: ''{category}'''
		format:
			(Dictionary
				newFrom:
					{(#superclass -> anRGClass superclass name).
					(#className -> anRGClass name).
					(#layout -> realClass classLayout class name).
					(#traits -> traitsString).
					(#slots -> slotsString).
					(#classVariables -> (self classVariablesStringFor: realClass)).
					(#poolDictionaries -> realClass sharedPoolsString).
					(#category -> realClass category)})]
			ifTrue: [ 
	definition := '{superclass} named: #{className} 
		uses: {traits} 
		slots: {slots} 
		category: ''{category}'''
		format:
			(Dictionary
				newFrom:
					{(#superclass -> anRGClass superclass name).
					(#className -> anRGClass name).
					(#traits -> traitsString).
					(#slots -> slotsString).
					(#category -> realClass category)}).				
				 ].

	self class compiler evaluate: definition.

	
	
]

{ #category : #installing }
FmxMBRealRingEnvironment >> adoptMethodsOf: realClass to: anRGClass [

	| generatedMethods |

	generatedMethods := Pragma allNamed: #generated in: realClass.
	generatedMethods
		do: [ :each | realClass removeSelector: each methodSelector ].
	anRGClass localMethods
		do: [ :method | 
			(realClass localSelectors includes: method name)
				ifFalse: [ realClass compile: method sourceCode classified: method protocol ] ].
			
	generatedMethods := Pragma allNamed: #generated in: realClass classSide.
	generatedMethods
		do: [ :each | realClass classSide removeSelector: each methodSelector ].
	anRGClass classSide localMethods
		do: [ :method | 
			(realClass classSide localSelectors includes: method name)
				ifFalse: [ realClass classSide compile: method sourceCode classified: method protocol ] ]
			
]

{ #category : #accessing }
FmxMBRealRingEnvironment >> apply [

	self ensurePackagesFrom: ringEnvironment.
	self ensureClassesFrom: ringEnvironment.

]

{ #category : #installing }
FmxMBRealRingEnvironment >> classVariablesStringFor: realClass [

	^ '{', ((realClass classVarNames collect: [ :each | '#', each ]) joinUsing: ' '), '}'
]

{ #category : #installing }
FmxMBRealRingEnvironment >> compile: aSource in: aClass classified: aProtocol package: aPackageName [

	aClass compile: aSource classified: '*', aPackageName, '-', aProtocol.

]

{ #category : #installing }
FmxMBRealRingEnvironment >> ensureClassesFrom: anRGEnvironment [
	
	| resolvedClasses sorted notSorted toMove |
	
	resolvedClasses := ringEnvironment ask behaviors select: [ :each | each isRingResolved ].
	resolvedClasses := resolvedClasses select: [ :each | each superclass isRingResolved ].
	
	resolvedClasses ifEmpty: [ ^ self ].

	notSorted := resolvedClasses asOrderedCollection.
	sorted := OrderedCollection new.
	[	
		toMove := notSorted select: [ :each | notSorted noneSatisfy: [ :toCompare | each dependsOn: toCompare ] ].
		toMove ifEmpty: [ self error: 'Classes cycling dependency' ].
		sorted addAll: toMove.
		notSorted removeAll: toMove.
		notSorted isEmpty.
	] whileFalse.

	resolvedClasses := sorted.

	resolvedClasses do: [:each | self installClassChangesFor: each ].
]

{ #category : #installing }
FmxMBRealRingEnvironment >> ensurePackagesFrom: anRGEnvironment [
	
	| resolvedPackages |
	
	resolvedPackages := anRGEnvironment ask packages select: [ :each | each isRingResolved ].

	resolvedPackages do: [ :each |
		(RPackageOrganizer default includesPackageNamed: each name)
			ifFalse: [ RPackageOrganizer default registerPackageNamed: each name]].
]

{ #category : #installing }
FmxMBRealRingEnvironment >> generateTraitsDescriptionFrom: anRGClass [

	| generatedTraits |
	
	generatedTraits := anRGClass traitComposition transformations.
	
	anRGClass classSide compile: ('generatedTraitNames
	<generated>
	^ {1}' format: { '#(', ((generatedTraits collect: #name) joinUsing: ' '), ')' }) classified: 'generator'
		

]

{ #category : #installing }
FmxMBRealRingEnvironment >> generatedSlotsOf: aRealClass [

	| slotNames |
	
	slotNames := (aRealClass classSide canUnderstand: #generatedSlotNames)
		ifTrue: [ aRealClass generatedSlotNames ]
		ifFalse: [ Array new ].
		
	^ (slotNames collect: [ :slotName | aRealClass slotNamed: slotName ifFound: [ :slot | slot ] ifNone: nil ]) select: #notNil.
	
	
]

{ #category : #installing }
FmxMBRealRingEnvironment >> generatedTraitNamessOf: aRealClass [

	| traitNames |
	
	^ traitNames := (aRealClass classSide canUnderstand: #generatedTraitNames)
		ifTrue: [ aRealClass generatedTraitNames ]
		ifFalse: [ Array new ].
		

	
	
]

{ #category : #installing }
FmxMBRealRingEnvironment >> generatedTraitsOf: aRealClass [

	| traitNames |
	
	traitNames := (aRealClass classSide canUnderstand: #generatedTraitNames)
		ifTrue: [ aRealClass generatedTraitNames ]
		ifFalse: [ Array new ].
		
	^ (traitNames collect: [ :traitName | aRealClass traitComposition transformations detect: [ :each | each name = traitName ] ifNone: [nil] ]) select: #notNil.
	
	
]

{ #category : #installing }
FmxMBRealRingEnvironment >> installClassChangesFor: anRGClass [

	| realClass | 
	
	realClass := self class environment classNamed: anRGClass name.
	realClass 
		ifNil: [ 
			realClass := self class compiler evaluate: anRGClass definition.]
		ifNotNil: [ 
			self adoptClassDefinitionOf: realClass to: anRGClass. ].
	self adoptClassCommentOf: realClass to: anRGClass.
	self cleanClass: realClass.
	self generateSlotsDescriptionFrom: anRGClass.
	self generateTraitsDescriptionFrom: anRGClass.
	self adoptMethodsOf: realClass to: anRGClass
		
]
