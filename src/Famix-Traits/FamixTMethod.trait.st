"
FAMIXMethod represents a behaviour in an object-oriented language.

A FAMIXMethod is always contained in a parentType.
"
Trait {
	#name : #FamixTMethod,
	#instVars : [
		'#isAbstract',
		'#isClassSide',
		'#isPublic',
		'#kind',
		'#parentType => FMOne type: #FamixTWithMethods opposite: #methods'
	],
	#category : #'Famix-Traits-Method'
}

{ #category : #meta }
FamixTMethod classSide >> annotation [

	<MSEClass: #TMethod super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #groups }
FamixTMethod classSide >> famixTMethodRelatedGroup [

	<mooseGroup>
	
	^ FAMIXMethodGroup
]

{ #category : #generator }
FamixTMethod classSide >> generatedSlotNames [
	<generated>
	'FamixTMethod class>>#generatedSlotNames'.
	^ #(isAbstract isClassSide kind parentType)
]

{ #category : #generator }
FamixTMethod classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #metrics }
FamixTMethod >> cyclomaticComplexity [
	<MSEProperty: #cyclomaticComplexity type: #Number>
	<MSEComment: 'The number of linear-independent paths through a method.'>
	^ self
		lookUpPropertyNamed:  #cyclomaticComplexity
		computedAs: [ self notExistentMetricValue ]
]

{ #category : #metrics }
FamixTMethod >> cyclomaticComplexity: aNumber [

	self privateState propertyAt: #cyclomaticComplexity put: aNumber
]

{ #category : #accessing }
FamixTMethod >> isAbstract [

	<MSEProperty: #isAbstract type: #Boolean>
	<generated>
	<MSEComment: 'True if abstract method'>
	^ isAbstract
]

{ #category : #accessing }
FamixTMethod >> isAbstract: anObject [

	<generated>
	isAbstract := anObject

]

{ #category : #accessing }
FamixTMethod >> isClassSide [

	<MSEProperty: #isClassSide type: #Boolean>
	<generated>
	<MSEComment: 'True if class-side method'>
	^ isClassSide
]

{ #category : #accessing }
FamixTMethod >> isClassSide: anObject [

	<generated>
	isClassSide := anObject

]

{ #category : #testing }
FamixTMethod >> isConstant [
	<MSEProperty: #isConstant type: #Boolean>
	<derived>
	<MSEComment: 'True if the method simply returns a constant'>
	^#constant = self kind
]

{ #category : #testing }
FamixTMethod >> isConstructor [
	<MSEProperty: #isConstructor type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is a constructor of the class'>

	^ #constructor = self kind or: [ 
		self privateState propertyAt: #isConstructor ifAbsent: [false] ]
]

{ #category : #testing }
FamixTMethod >> isConstructor: aBoolean [
	aBoolean 
		ifTrue: [ self kind: #constructor ]
		ifFalse: [ 
			self isConstructor ifTrue: [ self kind: nil ] ]
]

{ #category : #testing }
FamixTMethod >> isGetter [
	<MSEProperty: #isGetter type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is a getter of an attribute'>
	
	^#getter = self kind
]

{ #category : #testing }
FamixTMethod >> isMethod [

	<generated>
	^ true
]

{ #category : #testing }
FamixTMethod >> isPureAccessor [
	^self isGetter
		or: [self isSetter
		or: [self privateState propertyAt: #isPureAccessor ifAbsent: [false]]]
]

{ #category : #testing }
FamixTMethod >> isSetter [
	<MSEProperty: #isSetter type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is a setter on an attribute'>

	^#setter = self kind
]

{ #category : #accessing }
FamixTMethod >> kind [

	<MSEProperty: #kind type: #String>
	<generated>
	<MSEComment: 'Tag indicating a setter, getter, constant, constructor, or abstract method'>
	^ kind
]

{ #category : #accessing }
FamixTMethod >> kind: anObject [

	<generated>
	kind := anObject

]

{ #category : #metrics }
FamixTMethod >> numberOfMessageSends [
	<MSEProperty: #numberOfMessageSends type: #Number>
	<derived>
	<MSEComment: 'The number of message from a method'>
	^ self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [ self notExistentMetricValue ]
]

{ #category : #metrics }
FamixTMethod >> numberOfMessageSends: aNumber [

	self privateState propertyAt: #numberOfMessageSends put: aNumber
]

{ #category : #accessing }
FamixTMethod >> parentType [

	<generated>
	<MSEComment: 'Type declaring the method. It provides the implementation for belongsTo.'>
	<container>

	^ parentType
]

{ #category : #accessing }
FamixTMethod >> parentType: anObject [

	parentType := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTMethod >> parentTypeGroup [

	<generated>
	<navigation: 'ParentType'>
	^ MooseGroup
			with: (self parentType)
]

{ #category : #testing }
FamixTMethod >> parentTypeIsStub [

	^ self parentType ifNotNil: [ :e | e isStub ] ifNil: [ true ]
]
