"
FamixMetamodelBuilderTrait
"
Class {
	#name : #FmxMBTrait,
	#superclass : #FmxMBBehavior,
	#instVars : [
		'sides',
		'gluedTraits',
		'glueingCondition'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBTrait >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitTrait: self.
]

{ #category : #accessing }
FmxMBTrait >> allTraitGeneralizations [

	^ (self traitGeneralizations flatCollect: [ :each | {each}, each allTraitGeneralizations ]) asSet.
	

]

{ #category : #accessing }
FmxMBTrait >> allTraitNames [

	^ self traitGeneralizations collect: #fullName
]

{ #category : #generating }
FmxMBTrait >> as: aTraitName property: propertyName [

	self name = aTraitName
		ifFalse: [ FmxMBTraitRenamingError signal ].
	
	^ self property: propertyName

	
]

{ #category : #testing }
FmxMBTrait >> canGlueTo: aClass [

	^ glueingCondition 
		ifNotNil: [ glueingCondition value: aClass ]
		ifNil: [ false ]
]

{ #category : #generating }
FmxMBTrait >> classGeneralization [

	^ self builder environment basicTrait
]

{ #category : #generating }
FmxMBTrait >> defaultSuperclass [
	
	^ self builder environment basicTrait
]

{ #category : #'settings-default' }
FmxMBTrait >> defaultTag [

	^ self builder configuration traitTag
]

{ #category : #accessing }
FmxMBTrait >> generalization: anObject [

	^ anObject isSymbol
		ifTrue: [ self addTraitGeneralization: (self builder ensureTraitNamed: anObject) ]
		ifFalse: [ 
			anObject isMetamodelTrait 
				ifTrue: [ self addTraitGeneralization: anObject ]
				ifFalse: [ FmxMBTraitsGeneralizationError signal ] ]
			
	
]

{ #category : #generating }
FmxMBTrait >> generate [

	| aTrait traitName |
		
	self willGenerate ifFalse: [ ^ self ].
	
	traitName := self fullName.
	
	aTrait := self builder environment createTraitNamed: traitName asSymbol uses: self allTraitNames slots: self slotDefinitions in: self packageName overwrite: true.

	aTrait tagWith: self tag.
	self builder environment setComment: self comment for: aTrait.
			
	self realClass: aTrait.
	
	self generateAccessors.
	self generateAnnotationIn: aTrait as: self name superclass: nil.
	
	self generateTestingMethodsIn: aTrait.
	self generateRootMetamodelMethodIn: aTrait.

]

{ #category : #generating }
FmxMBTrait >> generateAnnotationIn: aRealClass as: aName superclass: aSuperclass [

	| aSuperclassName |
	
	aSuperclassName := aSuperclass  
		ifNotNil: [ aSuperclass name ]
		ifNil: [ 
		aSuperclassName := (self classGeneralization = self defaultSuperclass) 
			ifTrue: [ self defaultSuperclass name]
			ifFalse: [ self classGeneralization 
				ifNil: [ self defaultSuperclass name ]
				ifNotNil: [ 
					self classGeneralization realClass name ] ] ].

	aRealClass classSide compile: ('annotation

	<MSEClass: #{1} super: #{2}>
	<generated>
	<package: {3}>
	^self' format: { aName. aSuperclassName. self builder safeAnnotationPackageName})
		classified: 'meta'

]

{ #category : #generating }
FmxMBTrait >> generateRemotes [

	| aTrait traitName |
		
	traitName := self fullName.
	
	aTrait := self builder environment classNamed: traitName asSymbol.
				
	self realClass: aTrait.

	self realClass: aTrait.
	
	self generateRemoteAccessors.

]

{ #category : #accessing }
FmxMBTrait >> glueingCondition [

	<ignoreForCoverage>
	^ glueingCondition
]

{ #category : #accessing }
FmxMBTrait >> glueingCondition: anObject [
	glueingCondition := anObject
]

{ #category : #testing }
FmxMBTrait >> glues: otherTraits [

	gluedTraits := otherTraits asSet. 
]

{ #category : #testing }
FmxMBTrait >> glues: trait1 with: trait2 [

	self glues: { trait1. trait2 }.
	

]

{ #category : #testing }
FmxMBTrait >> gluesOneOf: selectedTraits [

	gluedTraits ifEmpty: [ ^ false ].

	^ selectedTraits anySatisfy: [ :each | gluedTraits includes: each ]
]

{ #category : #testing }
FmxMBTrait >> gluesSomeOf: selectedTraits [

	gluedTraits ifEmpty: [ ^ false ].

	^ selectedTraits includesAll: gluedTraits
]

{ #category : #initialization }
FmxMBTrait >> initialize [

	super initialize.
	
	gluedTraits := Set new.
	

]

{ #category : #testing }
FmxMBTrait >> isGlueingTrait [
	
	<ignoreForCoverage>
	^ false
]

{ #category : #testing }
FmxMBTrait >> isMetamodelTrait [

	^ true
]

{ #category : #'name conversion' }
FmxMBTrait >> pluralPropertyName [

	| uncapitalized |
	
	uncapitalized := (self name withoutPrefix: 'T') uncapitalized.
	^ self pluralOf: uncapitalized

]

{ #category : #'name conversion' }
FmxMBTrait >> propertyName [
	
	^ (self name withoutPrefix: 'T') uncapitalized.
	
	
]

{ #category : #'name conversion' }
FmxMBTrait >> relatedOwnerTraitName [

	^ self name
]

{ #category : #accessing }
FmxMBTrait >> relatedTraitName [

	^ self name
]

{ #category : #accessing }
FmxMBTrait >> removeRelationSide: aRelationSide [

	properties remove: aRelationSide ifAbsent: [ ].
]
