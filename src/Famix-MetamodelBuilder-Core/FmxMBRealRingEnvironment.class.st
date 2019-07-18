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
	| customSlots customTraitNames customSlotNames slotDefinitions slotsString definition traitsDefinitions traitsString |

	(realClass needToAdaptTo: anRGClass) ifFalse: [ ^ self ].

	customSlots := realClass localSlots copyWithoutAll: realClass generatedSlots.
	customSlotNames := customSlots collect: #name.
	customTraitNames := (realClass traitComposition members select: [ :e | realClass customTraits includes: e innerClass ]) collect: #traitCompositionExpression.
	slotDefinitions := ((anRGClass slots reject: [ :each | customSlotNames includes: each name ]) collect: #definitionString) asOrderedCollection.
	traitsDefinitions := (anRGClass traitComposition transformations collect: #asString) , customTraitNames.
	slotDefinitions addAll: (customSlots collect: #definitionString).
	slotDefinitions := slotDefinitions sorted.

	slotsString := '{' , (slotDefinitions joinUsing: '. ') , '}'.
	traitsString := traitsDefinitions ifEmpty: [ '{ }' ] ifNotEmpty: [ traitsDefinitions joinUsing: ' + ' ].
	definition := anRGClass isTrait
		ifFalse: [ '{superclass} subclass: #{className} 
		uses: {traits} 
		slots: {slots} 
		classVariables: {classVariables}
		poolDictionaries: ''{poolDictionaries}''
		category: ''{category}'''
				format:
					(Dictionary
						newFrom:
							{(#superclass -> anRGClass superclass name) . (#className -> anRGClass name) . (#layout -> realClass classLayout class name) . (#traits -> traitsString) . (#slots -> slotsString).
							(#classVariables -> (self classVariablesStringFor: realClass)) . (#poolDictionaries -> realClass sharedPoolsString) . (#category -> realClass category)}) ]
		ifTrue: [ '{superclass} named: #{className} 
		uses: {traits} 
		slots: {slots} 
		category: ''{category}'''
				format: (Dictionary newFrom: {(#superclass -> anRGClass superclass name) . (#className -> anRGClass name) . (#traits -> traitsString) . (#slots -> slotsString) . (#category -> realClass category)}) ].

	self class compiler evaluate: definition
]

{ #category : #installing }
FmxMBRealRingEnvironment >> adoptMethodsOf: realClass to: anRGClass [
	| generatedMethodsOfRealClass generatedMethodNamesOfRealClass |
	generatedMethodsOfRealClass := (Pragma allNamed: #generated in: realClass) collect: #method thenSelect: [ :method | realClass localMethods includes: method ].	"We reject methods comming from Traits"
	generatedMethodNamesOfRealClass := generatedMethodsOfRealClass collect: #selector.

	"First we removed the generated methods should not be here anymore"
	(generatedMethodNamesOfRealClass difference: anRGClass localSelectors) do: [ :selectorOfRemovedGeneratedMethod | realClass removeSelector: selectorOfRemovedGeneratedMethod ].

	"Add new generated methods"
	(anRGClass localSelectors difference: generatedMethodNamesOfRealClass)
		do: [ :selectorOfMethodToAdd | (realClass localSelectors includes: selectorOfMethodToAdd) ifFalse: [ self compile: (anRGClass methodNamed: selectorOfMethodToAdd) into: realClass ] ].

	"Finally, update methods needing updates"
	(generatedMethodNamesOfRealClass intersection: anRGClass localSelectors)
		do: [ :selectorOfMethodToUpdate | (anRGClass methodNamed: selectorOfMethodToUpdate) in: [ :method | (realClass needToAdaptToMethod: method) ifTrue: [ self compile: method into: realClass ] ] ]
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
FmxMBRealRingEnvironment >> compile: aRGMethod into: realClass [
	^ realClass compile: aRGMethod sourceCode classified: aRGMethod protocol
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
FmxMBRealRingEnvironment >> generatedSlotsOf: aRealClass [
	^ (aRealClass generatedSlotNames collect: [ :slotName | aRealClass slotNamed: slotName ifFound: [ :slot | slot ] ifNone: nil ]) select: #notNil
]

{ #category : #installing }
FmxMBRealRingEnvironment >> installClassChangesFor: anRGClass [
	| realClass |
	realClass := self class environment classNamed: anRGClass name.
	realClass ifNil: [ realClass := self class compiler evaluate: anRGClass definition ] ifNotNil: [ self adoptClassDefinitionOf: realClass to: anRGClass ].
	self adoptClassCommentOf: realClass to: anRGClass.
	self cleanClass: realClass.
	self adoptMethodsOf: realClass to: anRGClass.
	self adoptMethodsOf: realClass classSide to: anRGClass classSide.
	self removeGeneratedSlotNamesMethodOf: realClass
]

{ #category : #installing }
FmxMBRealRingEnvironment >> removeGeneratedSlotNamesMethodOf: aClass [
	self flag: #toRemoveSlotGeneration.	"Before, a method was generated to kmow generated slots. Now, we use a dedicated slot for that and we can just collect them. This should be removed later when all metamodel will be migrated.
	
	Remove in 2020."

	aClass class methods detect: [ :m | m selector = #generatedSlotNames ] ifFound: #removeFromSystem
]
