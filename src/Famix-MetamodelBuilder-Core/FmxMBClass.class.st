Class {
	#name : #FmxMBClass,
	#superclass : #FmxMBBehavior,
	#instVars : [
		'classGeneralization'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBClass >> acceptVisitor: aVisitor [
	
	<ignoreForCoverage>
	^ aVisitor visitClass: self.
]

{ #category : #accessing }
FmxMBClass >> allClassGeneralizations [

	| result c g|
	result := OrderedCollection new.
	c := self.
	[ g := c classGeneralization. g notNil ] whileTrue: [ 
		result add: g.
		c := g ].
	^ result

]

{ #category : #accessing }
FmxMBClass >> allLocalTraits [
	^ self traitsFromRelations , super allLocalTraits
]

{ #category : #accessing }
FmxMBClass >> classGeneralization [
	^ classGeneralization
]

{ #category : #accessing }
FmxMBClass >> classGeneralization: anObject [
	
	classGeneralization := anObject.
	^ anObject
]

{ #category : #generating }
FmxMBClass >> generate [

	| aClass aSuperclass aClassName |
	
	self willGenerate ifFalse: [ ^ self ].
	
	aClassName := self fullName.
	
	aSuperclass := 	self classGeneralization 
		ifNil: [ self defaultSuperclass ]
		ifNotNil: [ self classGeneralization realClass ].
	
	aClass := self builder environment createClassNamed: aClassName asSymbol superclass: aSuperclass traitNames: self allTraitNames slots: self slotDefinitions in: self packageName overwrite: true.
	
	aClass tagWith: self tag.
	self builder environment setComment: self comment for: aClass.
			
	self realClass: aClass.
	
	self generateAccessors.
	self generateAnnotationIn: aClass as: self name superclass: nil.
	
	self generateTestingMethodsIn: aClass.
	self generateRootMetamodelMethodIn: aClass.

	self generateMethodsToRemoveFromTraitCompositionFor: aClass.
	
	self generateNavigationGroupsFor: aClass.
	self generateAddToCollectionFor: aClass
]

{ #category : #generating }
FmxMBClass >> generateRemotes [
	| aClass aClassName |
	aClassName := self fullName.

	aClass := self class environment at: aClassName asSymbol ifAbsent: [ self builder environment classNamed: aClassName asSymbol ].

	self realClass: aClass.

	self generateRemoteAccessors
]

{ #category : #generating }
FmxMBClass >> generateRootMetamodelMethodIn: aClass [
	self isRoot ifFalse: [ ^ self ].

	self builder configuration mooseModelName
		ifNotNil: [ :mooseModelName | 
			aClass classSide
				compile:
					('metamodel

	<generated>
	^ {1} metamodel' format: {mooseModelName})
				classified: 'meta' ]
]

{ #category : #accessing }
FmxMBClass >> generateTestingMethodsIn: aClass [
	self isRoot
		ifTrue: [ builder testingSelectorsMapping
				keysAndValuesDo: [ :concernedClass :selectors | 
					"In case a testing selector is relatif to a Trait that is not used in the current MM, then we do not need to generate the testing selector."
					(concernedClass isMetamodelTrait and: [ builder classes noneSatisfy: [ :class | class allTransitiveTraits includes: concernedClass ] ])
						ifFalse: [ selectors
								do: [ :sel | 
									| selectorsFromTraits |
									selectorsFromTraits := self traitGeneralizations flatCollect: #testingSelectors.
									(selectorsFromTraits includes: sel) ifFalse: [ aClass instanceSide compile: ('{1}\\	<generated>\	^ false' withCRs format: {sel}) classified: #testing ] ] ] ] ].

	super generateTestingMethodsIn: aClass
]

{ #category : #testing }
FmxMBClass >> isMetamodelClass [

	^ true
]

{ #category : #testing }
FmxMBClass >> isRoot [
	^ self classGeneralization isNil
]

{ #category : #generating }
FmxMBClass >> subclassOf: aClass [
	
	self generalization: aClass
]

{ #category : #accessing }
FmxMBClass >> traitsFromRelations [
	"returns traits defined by relations"

	^ (self relations collect: [ :each | each side trait ] thenSelect: #isNotNil) asSet
]
