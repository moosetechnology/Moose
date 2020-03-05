Class {
	#name : #FmxMBTrait,
	#superclass : #FmxMBBehavior,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBTrait >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitTrait: self.
]

{ #category : #accessing }
FmxMBTrait >> allTraitGeneralizations [
	^ (self traitGeneralizations flatCollect: [ :each | {each} , each allTraitGeneralizations ]) asSet
]

{ #category : #generating }
FmxMBTrait >> classGeneralization [

	^ self builder environment basicTrait
]

{ #category : #accessing }
FmxMBTrait >> classGeneralization: anObject [
	FmxMBTraitsGeneralizationError signal
]

{ #category : #generating }
FmxMBTrait >> defaultSuperclass [
	
	^ self builder environment basicTrait
]

{ #category : #accessing }
FmxMBTrait >> defaultSuperclassName [
	"In case of Traits we want the annotation to point Object as superclass."

	^ 'Object'
]

{ #category : #'settings-default' }
FmxMBTrait >> defaultTag [

	^ self builder configuration traitTag
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
	self generateMethodsToRemoveFromTraitCompositionFor: aTrait.
	self generatePrecedenceInTraitComposition: aTrait.
	
	self generateNavigationGroupsFor: aTrait.
	self generateAddToCollectionFor: aTrait
]

{ #category : #generating }
FmxMBTrait >> generateRemotes [
	| aTrait traitName |
	traitName := self fullName.

	aTrait := self builder environment classNamed: traitName asSymbol.

	self realClass: aTrait.

	self generateRemoteAccessors
]

{ #category : #testing }
FmxMBTrait >> isMetamodelTrait [

	^ true
]

{ #category : #'name conversion' }
FmxMBTrait >> pluralPropertyName [
	^ self pluralOf: self propertyName
]

{ #category : #'name conversion' }
FmxMBTrait >> propertyName [
	^ (self name withoutPrefix: 'T') uncapitalized
]

{ #category : #accessing }
FmxMBTrait >> removeRelationSide: aRelationSide [

	properties remove: aRelationSide ifAbsent: [ ].
]
