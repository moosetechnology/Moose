Class {
	#name : #FamixStClass,
	#superclass : #FamixStType,
	#traits : 'FamixTClass + FamixTClassHierarchyNavigation + FamixTContainingWithInvocationsGlue + FamixTLCOMMetrics + FamixTWithExceptions + FamixTWithMethods + FamixTWithMethodsWithAccessesGlue + FamixTWithMethodsWithModifiersGlue + FamixTWithSubInheritances + FamixTWithSuperInheritances',
	#classTraits : 'FamixTClass classTrait + FamixTClassHierarchyNavigation classTrait + FamixTContainingWithInvocationsGlue classTrait + FamixTLCOMMetrics classTrait + FamixTWithExceptions classTrait + FamixTWithMethods classTrait + FamixTWithMethodsWithAccessesGlue classTrait + FamixTWithMethodsWithModifiersGlue classTrait + FamixTWithSubInheritances classTrait + FamixTWithSuperInheritances classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStClass class >> annotation [

	<MSEClass: #Class super: #FamixStType>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStClass class >> generatedSlotNames [
	<generated>
	'FamixStClass class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStClass class >> generatedTraitNames [
	<generated>
	^ #(FamixTClass FamixTClassHierarchyNavigation FamixTContainingWithInvocationsGlue FamixTLCOMMetrics FamixTWithExceptions FamixTWithMethods FamixTWithMethodsWithAccessesGlue FamixTWithMethodsWithModifiersGlue FamixTWithSubInheritances FamixTWithSuperInheritances)
]

{ #category : #meta }
FamixStClass class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> isIgnored [
	<MSEProperty: #isIgnored type: #Boolean>
	<multivalued>
	<derived>
	<MSEComment:
		'If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed'>
	^ (self isAnnotatedWith: 'Ignore') 
]

{ #category : #'Famix-Implementation' }
FamixStClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
]

{ #category : #'Famix-Implementation' }
FamixStClass >> mooseNameOn: aStream [ 
	| parent |
	parent := self typeContainer.
	parent ifNotNil: 
		[ 
			parent mooseNameOn: aStream.
			aStream
				nextPut: $:;
				nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> smalltalkClass [ 
	"Returns the associated smalltalk class if it exist in the system."
	
	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: 
			self name  ifAbsent: [nil] 
]

{ #category : #'Famix-Implementation' }
FamixStClass >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	 ^ self smalltalkClass 
        ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ] 
        ifNil: [ super sourceText ]
]
