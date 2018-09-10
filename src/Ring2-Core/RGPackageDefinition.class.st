"
RGPackageDefinition is the representation for packages.
A package manages classes, methods and children packages as elements.
A package can also know in which package is defined

"
Class {
	#name : #RGPackageDefinition,
	#superclass : #RGObject,
	#instVars : [
		'definedBehaviors',
		'extensionMethods',
		'tagsForClasses'
	],
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'accessing - backend' }
RGPackageDefinition >> addClassTag: sSymbol [

	self backend forPackage addClassTag: sSymbol to: self
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> addDefinedBehavior: anRGBehavior [

	self backend forPackage addDefinedBehavior: anRGBehavior to: self
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> addExtensionMethod: anRGMethod [ 

	self backend forPackage addExtensionMethod: anRGMethod to: self
]

{ #category : #'managing container' }
RGPackageDefinition >> addoptToParentStub [

	self isRingResolved ifFalse: [ ^ self ].
	
	super addoptToParentStub.

	^ self parent addPackage: self.
]

{ #category : #accessing }
RGPackageDefinition >> categories [
	
	^ self definedBehaviors collect: #category as: Set

]

{ #category : #accessing }
RGPackageDefinition >> categoryName [

	^ self name 
]

{ #category : #accessing }
RGPackageDefinition >> classNames [

	^ self classes collect: #name
]

{ #category : #accessing }
RGPackageDefinition >> classes [
	"Retrieves a collection of classes defined in the receiver and classes holding extension methods"
		
	^self definedClassesOnly, self extendedClasses 
]

{ #category : #'accessing - model' }
RGPackageDefinition >> classesTaggedWith: aSymbol [

	^ self definedBehaviors select: [ :each | each isTaggedWith: aSymbol ]
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> cleanDefinedBehaviors [

	self backend forPackage cleanDefinedBehaviorsFor: self
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> cleanExtensionMethods [

	self backend forPackage cleanExtensionMethodsFor: self
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> cleanTagsForClasses [

	self backend forPackage cleanTagsForClassesFor: self
]

{ #category : #'default model values' }
RGPackageDefinition >> defaultDefinedBehaviors [

	^ Set new
]

{ #category : #'default model values' }
RGPackageDefinition >> defaultExtensionMethods [

	^ Set new
]

{ #category : #'managing container' }
RGPackageDefinition >> defaultParentStub [

	^ RGEnvironment new
		yourself.
]

{ #category : #'default model values' }
RGPackageDefinition >> defaultTagsForClasses [

	^ Set new
]

{ #category : #'queries - behaviors' }
RGPackageDefinition >> definedBehaviors [

	| allDefinedBehaviors |
	allDefinedBehaviors := IdentitySet new.
	self definedBehaviorsDo: [ :each | allDefinedBehaviors add: each].
	^ allDefinedBehaviors asArray
	
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> definedBehaviorsDo: aBlock [

	self backend forPackage definedBehaviorsFor: self do: aBlock
]

{ #category : #accessing }
RGPackageDefinition >> definedClassNames [

	^ self definedClassesOnly collect: #name 
]

{ #category : #accessing }
RGPackageDefinition >> definedClasses [

	^ self definedBehaviors
]

{ #category : #'queries - behaviors' }
RGPackageDefinition >> definedClassesOnly [

	^ self definedBehaviors select: #isClass
]

{ #category : #accessing }
RGPackageDefinition >> definedTraits [
	"Retrieves the traits defined in the receiver"

	^self definedBehaviors select: #isTrait
]

{ #category : #accessing }
RGPackageDefinition >> extendedBehaviors [
	
	^ ((self extensionMethods collect: #parent) collect: [:behavior |
		behavior isClass 
			ifTrue: [behavior ]
			ifFalse: [ behavior baseClass]] as: IdentitySet) asArray
]

{ #category : #accessing }
RGPackageDefinition >> extendedClasses [
	
	^ self extendedBehaviors
]

{ #category : #accessing }
RGPackageDefinition >> extendedClassesAndTraits [
	
	^ self extendedBehaviors
]

{ #category : #accessing }
RGPackageDefinition >> extendedSelectors [
	"Retrieves the names of the methods"
	
	^ self extensionMethods collect: #selector
]

{ #category : #accessing }
RGPackageDefinition >> extendedTraits [
	
	^ (self extensionMethods collect: #parent) select: #isTrait
]

{ #category : #accessing }
RGPackageDefinition >> extensionMethods [

	| allMethods |
	allMethods := IdentitySet new.
	self extensionMethodsDo: [ :each | allMethods add: each].
	^ allMethods asArray

]

{ #category : #'accessing - backend' }
RGPackageDefinition >> extensionMethodsDo: aBlock [

	self backend forPackage extensionMethodsFor: self do: aBlock
]

{ #category : #initialization }
RGPackageDefinition >> initialize [

	super initialize.

	extensionMethods := self unresolvedValue: self defaultExtensionMethods.
	definedBehaviors := self unresolvedValue: self defaultDefinedBehaviors.
	tagsForClasses := self unresolvedValue: self defaultTagsForClasses.

]

{ #category : #initialization }
RGPackageDefinition >> initializeUnresolved [

	super initializeUnresolved.

	extensionMethods := self unresolvedValue: self defaultDefinedBehaviors.
	definedBehaviors := self unresolvedValue: self defaultExtensionMethods.
	tagsForClasses := self unresolvedValue: self defaultTagsForClasses.

]

{ #category : #testing }
RGPackageDefinition >> isPackage [

	^true
]

{ #category : #resolving }
RGPackageDefinition >> makeResolved [

	super makeResolved.
	
	definedBehaviors := self definedBehaviors.
	extensionMethods := self extensionMethods.
	tagsForClasses := self tagsForClasses.

]

{ #category : #accessing }
RGPackageDefinition >> methods [
	"Retrieves all the methods defined in the receiver. 
	#methods holds the methods of defined classes"
	
	^ (self definedBehaviors flatCollect: #methods), self extensionMethods 
]

{ #category : #accessing }
RGPackageDefinition >> name: aString [

	| oldName |
	
	oldName := self name.
	super name: aString.
	
	self announce: (RPackageRenamed 
			to: self 
			oldName: oldName 
			newName: aString)
]

{ #category : #accessing }
RGPackageDefinition >> package [

	^ self
]

{ #category : #printing }
RGPackageDefinition >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: self name;
		nextPutAll: ')'
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtAddClassTag: aSymbol [
	
	tagsForClasses isRingResolved ifFalse: [ 
		self pvtCleanTagsForClasses  ].
	
	tagsForClasses add: aSymbol.	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtAddDefinedBehavior: anRGBehavior [

	self environment verifyOwnership: anRGBehavior.
	
	definedBehaviors isRingResolved ifFalse: [ 
		self pvtCleanDefinedBehaviors  ].
	
	definedBehaviors add: anRGBehavior.	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtAddExtensionMethod: aMethodDefinition [

	self environment verifyOwnership: aMethodDefinition.
	
	extensionMethods isRingResolved ifFalse: [ 
		self pvtCleanExtensionMethods  ].
	
	extensionMethods add: aMethodDefinition.
	
	"TODO:Announce"
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtCleanDefinedBehaviors [

	definedBehaviors := self defaultDefinedBehaviors.
		
	"TODO:Announce if not empty"
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtCleanExtensionMethods [

	extensionMethods := self defaultExtensionMethods.
		
	"TODO:Announce if not empty"
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtCleanTagsForClasses [

	tagsForClasses := self defaultTagsForClasses.
		
	"TODO:Announce if not empty"
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtDefinedBehaviorsDo: aBlock [

	^ definedBehaviors value do: aBlock
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtExtensionMethodsDo: aBlock [

	^ extensionMethods value do: aBlock
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtRemoveClassTag: aSymbol [
	
	tagsForClasses remove: aSymbol.
	
	"TODO:Announce"
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtRemoveDefinedBehavior: anRGBehavior [

	self environment verifyOwnership: anRGBehavior.
	
	definedBehaviors remove: anRGBehavior.
	
	"TODO:Announce"
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtRemoveExtensionMethod: anRGMethod [

	self environment verifyOwnership: anRGMethod.
	
	extensionMethods remove: anRGMethod.
	
	"TODO:Announce"
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtResolvableProperties [

	^ super pvtResolvableProperties, { 
		#definedBehaviors -> definedBehaviors. 
		#extensionMethods -> extensionMethods. 
		#tagsForClasses -> tagsForClasses
	}
	
	
]

{ #category : #'private - backend interface' }
RGPackageDefinition >> pvtTagsForClassesDo: aBlock [

	^ tagsForClasses value do: aBlock
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> removeClassTag: aSymbol [

	self backend forPackage removeClassTag: aSymbol from: self
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> removeDefinedBehavior: anRGBehavior [

	self backend forPackage removeDefinedBehavior: anRGBehavior from: self
]

{ #category : #'accessing - backend' }
RGPackageDefinition >> removeExtensionMethod: anRGMethod [ 

	self backend forPackage removeExtensionMethod: anRGMethod from: self
]

{ #category : #'accessing - model' }
RGPackageDefinition >> tagsForClasses [
	"Retrieves the traits defined in the receiver"

	| allTags |
	allTags := IdentitySet new.
	self tagsForClassesDo: [ :each | allTags add: each].
	^ allTags asArray

]

{ #category : #'accessing - backend' }
RGPackageDefinition >> tagsForClassesDo: aBlock [

	self backend forPackage tagsForClassesFor: self do: aBlock
]

{ #category : #accessing }
RGPackageDefinition >> traits [
	"Retrieves a collection of classes defined in the receiver and classes holding extension methods"
		
	^self definedTraits, self extendedTraits
]
