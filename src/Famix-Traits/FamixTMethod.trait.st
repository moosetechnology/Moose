"
FAMIXMethod represents a behaviour in an object-oriented language.

A FAMIXMethod is always contained in a parentType.
"
Trait {
	#name : #FamixTMethod,
	#instVars : [
		'#isAbstract => FMProperty',
		'#isClassSide => FMProperty',
		'#kind => FMProperty',
		'#parentType => FMOne type: #FamixTWithMethods opposite: #methods'
	],
	#traits : 'FamixTWithParameters + FamixTInvocable + FamixTWithInvocations + FamixTWithReferences + FamixTWithAccesses + FamixTWithLocalVariables + FamixTWithImplicitVariables + FamixTWithSignature + FamixTWithClassScope + FamixTTypedStructure + FamixTSourceEntity',
	#classTraits : 'FamixTWithParameters classTrait + FamixTInvocable classTrait + FamixTWithInvocations classTrait + FamixTWithReferences classTrait + FamixTWithAccesses classTrait + FamixTWithLocalVariables classTrait + FamixTWithImplicitVariables classTrait + FamixTWithSignature classTrait + FamixTWithClassScope classTrait + FamixTTypedStructure classTrait + FamixTSourceEntity classTrait',
	#category : #'Famix-Traits-Method'
}

{ #category : #meta }
FamixTMethod classSide >> annotation [

	<FMClass: #TMethod super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTMethod classSide >> famixTMethodRelatedGroup [

	<mooseGroup>
	
	^ FAMIXMethodGroup
]

{ #category : #metrics }
FamixTMethod >> cyclomaticComplexity [
	<FMProperty: #cyclomaticComplexity type: #Number>
	<FMComment: 'The number of linear-independent paths through a method.'>
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

	<FMProperty: #isAbstract type: #Boolean>
	<generated>
	<FMComment: 'True if abstract method'>
	^ isAbstract
]

{ #category : #accessing }
FamixTMethod >> isAbstract: anObject [
	<generated>
	isAbstract := anObject
]

{ #category : #accessing }
FamixTMethod >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean>
	<generated>
	<FMComment: 'True if class-side method'>
	^ isClassSide
]

{ #category : #accessing }
FamixTMethod >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]

{ #category : #testing }
FamixTMethod >> isConstant [
	<FMProperty: #isConstant type: #Boolean>
	<derived>
	<FMComment: 'True if the method simply returns a constant'>
	^#constant = self kind
]

{ #category : #testing }
FamixTMethod >> isConstructor [
	<FMProperty: #isConstructor type: #Boolean>
	<derived>
	<FMComment: 'True if the method is a constructor of the class'>

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
	<FMProperty: #isGetter type: #Boolean>
	<derived>
	<FMComment: 'True if the method is a getter of an attribute'>
	
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
	<FMProperty: #isSetter type: #Boolean>
	<derived>
	<FMComment: 'True if the method is a setter on an attribute'>

	^#setter = self kind
]

{ #category : #accessing }
FamixTMethod >> kind [

	<FMProperty: #kind type: #String>
	<generated>
	<FMComment: 'Tag indicating a setter, getter, constant, constructor, or abstract method'>
	^ kind
]

{ #category : #accessing }
FamixTMethod >> kind: anObject [
	<generated>
	kind := anObject
]

{ #category : #printing }
FamixTMethod >> mooseNameOn: stream [
	self parentType
		ifNotNil: [ :parent | 
			parent mooseNameOn: stream.
			stream nextPut: $. ].
	self signature
		ifNotNil: [ :aSignature | stream nextPutAll: aSignature ]
		ifNil: [ self name ifNotNil: [ :aName | stream nextPutAll: aName ] ]
]

{ #category : #metrics }
FamixTMethod >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message from a method'>
	^ self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [ self notExistentMetricValue ]
]

{ #category : #metrics }
FamixTMethod >> numberOfMessageSends: aNumber [

	self privateState propertyAt: #numberOfMessageSends put: aNumber
]

{ #category : #accessing }
FamixTMethod >> numberOfParameters [
	<FMProperty: #numberOfParameters type: #Number>
	<FMComment: 'The number of parameters in a method'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfParameters computedAs: [ self parameters size ]
]

{ #category : #accessing }
FamixTMethod >> parentType [
	"Relation named: #parentType type: #FamixTWithMethods opposite: #methods"

	<generated>
	<FMComment: 'Type declaring the method. It provides the implementation for belongsTo.'>
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
	^ MooseGroup with: self parentType
]

{ #category : #testing }
FamixTMethod >> parentTypeIsStub [

	^ self parentType ifNotNil: [ :e | e isStub ] ifNil: [ true ]
]
