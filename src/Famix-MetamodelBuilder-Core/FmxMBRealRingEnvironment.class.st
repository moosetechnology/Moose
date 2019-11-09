Class {
	#name : #FmxMBRealRingEnvironment,
	#superclass : #FmxMBRingEnvironment,
	#instVars : [
		'changesToApply'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBRealRingEnvironment >> apply [
	self collectChangesToApply.
	changesToApply do: #apply
]

{ #category : #installing }
FmxMBRealRingEnvironment >> classVariablesStringFor: realClass [

	^ '{', ((realClass classVarNames collect: [ :each | '#', each ]) joinUsing: ' '), '}'
]

{ #category : #accessing }
FmxMBRealRingEnvironment >> collectChangesToApply [
	| resolvedClasses resolvedPackages |
	changesToApply := OrderedCollection new.
	resolvedPackages := ringEnvironment ask packages select: [ :each | each isRingResolved ].
	resolvedClasses := ringEnvironment ask behaviors select: [ :each | each isRingResolved and: [ each superclass isRingResolved ] ].

	self recordPackagesChangesFor: resolvedPackages.
	self recordClassesChangesFor: resolvedClasses.
	self recordRemovalOfGeneratedEntitiesIn: resolvedPackages notPresentIn: resolvedClasses
]

{ #category : #installing }
FmxMBRealRingEnvironment >> compile: aSource in: aClass classified: aProtocol package: aPackageName [

	aClass compile: aSource classified: '*', aPackageName, '-', aProtocol.

]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordAdoptionOfClassDefinitionFrom: realClass to: anRGClass [
	| customSlots customSlotNames slotDefinitions slotsString definition traitsString |
	(realClass needToAdaptTo: anRGClass) ifFalse: [ ^ self ].

	customSlots := realClass localSlots copyWithoutAll: realClass generatedSlots.
	customSlotNames := customSlots collect: #name.
	slotDefinitions := ((anRGClass slots reject: [ :each | customSlotNames includes: each name ]) collect: #definitionString) asOrderedCollection.
	slotDefinitions addAll: (customSlots collect: #definitionString).
	slotDefinitions := slotDefinitions sorted.

	slotsString := '{' , (slotDefinitions joinUsing: '. ') , '}'.
	traitsString := self traitStringFrom: realClass to: anRGClass.
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

	changesToApply add: (FmxClassAddition definition: definition)
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordClassChangesFor: anRGClass [
	| realClass |
	realClass := self class environment classNamed: anRGClass name.
	realClass ifNil: [ changesToApply add: (FmxClassAddition definition: anRGClass definition) ] ifNotNil: [ self recordAdoptionOfClassDefinitionFrom: realClass to: anRGClass ].
	self recordClassCommentChangeOf: realClass to: anRGClass.
	self recordMethodsAdoptionsOf: realClass to: anRGClass realClassName: anRGClass name.
	self recordMethodsAdoptionsOf: (realClass ifNotNil: #class) to: anRGClass classSide realClassName: anRGClass name
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordClassCommentChangeOf: realClass to: anRGClass [
	| newComment |
	newComment := anRGClass comment content.
	(realClass isNotNil and: [ newComment = realClass comment ]) ifTrue: [ ^ self ].

	newComment isEmptyOrNil ifFalse: [ changesToApply add: (FmxClassCommentUpdate className: anRGClass name comment: newComment) ]
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordClassesChangesFor: resolvedClasses [
	| sorted notSorted toMove |
	resolvedClasses ifEmpty: [ ^ self ].
	
	notSorted := resolvedClasses asOrderedCollection.

	sorted := OrderedCollection new.
	[ toMove := notSorted select: [ :each | notSorted noneSatisfy: [ :toCompare | each dependsOn: toCompare ] ].
	toMove ifEmpty: [ self error: 'Classes cycling dependency' ].
	sorted addAll: toMove.
	notSorted removeAll: toMove.
	notSorted isEmpty ] whileFalse.

	sorted do: [ :each | self recordClassChangesFor: each ]
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordMethodsAdoptionsOf: realClass to: anRGClass realClassName: aClassName [
	| generatedMethodsOfRealClass generatedMethodNamesOfRealClass |
	generatedMethodsOfRealClass := realClass
		ifNil: [ {} ]
		ifNotNil: [ (Pragma allNamed: #generated in: realClass) collect: #method thenSelect: [ :method | "We reject methods comming from Traits" realClass localMethods includes: method ] ].

	generatedMethodNamesOfRealClass := generatedMethodsOfRealClass collect: #selector.

	"First we removed the generated methods should not be here anymore"
	(generatedMethodNamesOfRealClass difference: anRGClass localSelectors)
		ifNotEmpty: [ :selectorsOfRemovedGeneratedMethod | changesToApply add: (FmxMethodRemovals className: aClassName isClassSide: anRGClass isClassSide selectors: selectorsOfRemovedGeneratedMethod) ].

	"Add new generated methods"
	((anRGClass localSelectors difference: generatedMethodNamesOfRealClass)
		select: [ :selectorOfMethodToAdd | realClass ifNil: [ true ] ifNotNil: [ (realClass localSelectors includes: selectorOfMethodToAdd) not ] ]
		thenCollect: [ :selectorOfMethodToAdd | anRGClass methodNamed: selectorOfMethodToAdd ])
		ifNotEmpty: [ :methods | changesToApply add: (FmxMethodAdditions className: aClassName isClassSide: anRGClass isClassSide rgMethods: methods) ].

	"Finally, update methods needing updates"
	((generatedMethodNamesOfRealClass intersection: anRGClass localSelectors)
		collect: [ :selectorOfMethodToUpdate | anRGClass methodNamed: selectorOfMethodToUpdate ]
		thenSelect: [ :method | realClass needToAdaptToMethod: method ])
		ifNotEmpty: [ :methods | changesToApply add: (FmxMethodUpdates className: aClassName isClassSide: anRGClass isClassSide rgMethods: methods) ]
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordPackagesChangesFor: resolvedPackages [
	resolvedPackages
		select: [ :each | (RPackageOrganizer default includesPackageNamed: each name) not ]
		thenDo: [ :each | changesToApply add: (FmxPackageAddition named: each name) ]
]

{ #category : #accessing }
FmxMBRealRingEnvironment >> recordRemovalOfGeneratedEntitiesIn: resolvedPackages notPresentIn: resolvedClasses [
	"Since the last generation it is possible some behaviorals were removed from the generator. In that case we should remove them. We will remove all classes and traits of Famix that are not part of the current generator."

	resolvedPackages
		collect: [ :e | e name asPackageIfAbsent: [ nil ] ]
		thenDo: [ :package | 
			package
				ifNotNil:
					[ package definedClasses select: #isMetamodelEntity thenDo: [ :class | resolvedClasses detect: [ :rgClass | rgClass name = class name ] ifNone: [ changesToApply add: (FmxClassRemoval class: class) ] ] ] ]
]

{ #category : #testing }
FmxMBRealRingEnvironment >> regenerationIsNeeded [
	"Return true if a regeneration would cause changes in the system."

	self collectChangesToApply.
	^ changesToApply isNotEmpty
]

{ #category : #installing }
FmxMBRealRingEnvironment >> traitStringFrom: realClass to: aRGClass [
	"We need to collect the generated traits + the custom traits added by the user."

	| customTraitNames traitsDefinitions |
	customTraitNames := (realClass traitComposition rootMembers select: [ :e | realClass customTraitNames includes: e name ]) collect: #traitCompositionExpression.
	traitsDefinitions := aRGClass traitsDefinitions ifEmpty: [ {} ] ifNotEmpty: [ :rgDefinitions | {rgDefinitions anyOne} , (rgDefinitions allButFirst collect: [ :e | '(' , e , ')' ]) ].
	traitsDefinitions := traitsDefinitions , customTraitNames.
	^ traitsDefinitions ifEmpty: [ '{ }' ] ifNotEmpty: [ traitsDefinitions joinUsing: ' + ' ]
]
