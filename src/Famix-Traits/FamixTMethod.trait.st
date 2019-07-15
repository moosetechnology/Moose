"
FAMIXMethod represents a behaviour in an object-oriented language.

A FAMIXMethod is always contained in a parentType.
"
Trait {
	#name : #FamixTMethod,
	#instVars : [
		'#category',
		'#hasClassScope',
		'#isAbstract',
		'#isPublic',
		'#kind',
		'#parentType => FMOne type: #FamixTWithMethods opposite: #methods',
		'#timeStamp'
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
	^ #(category hasClassScope kind parentType timeStamp)
]

{ #category : #generator }
FamixTMethod classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTMethod >> category [

	<MSEProperty: #category type: #String>
	<generated>
	<MSEComment: 'Category of the method'>
	^ category
]

{ #category : #accessing }
FamixTMethod >> category: anObject [

	<generated>
	category := anObject

]

{ #category : #'Famix-Implementation' }
FamixTMethod >> computeNumberOfLinesOfCode [
	self hasSourceAnchor 
		ifTrue: [ ^ self sourceAnchor lineCount ].
	^ (self sourceText = '')
			ifTrue: [ self notExistentMetricValue ]
			ifFalse: [ self sourceText lineCount ]
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
FamixTMethod >> hasClassScope [

	<MSEProperty: #hasClassScope type: #Boolean>
	<generated>
	<MSEComment: 'True if class-side method'>
	^ hasClassScope
]

{ #category : #accessing }
FamixTMethod >> hasClassScope: anObject [

	<generated>
	hasClassScope := anObject

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

{ #category : #'Famix-Implementation' }
FamixTMethod >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<MSEComment: 'The number of lines of code in a method.'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #'Famix-Implementation' }
FamixTMethod >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
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

{ #category : #accessing }
FamixTMethod >> timeStamp [

	<MSEProperty: #timeStamp type: #String>
	<generated>
	<MSEComment: 'TimeStamp of the method with author and time of the last change'>
	^ timeStamp
]

{ #category : #accessing }
FamixTMethod >> timeStamp: anObject [

	<generated>
	timeStamp := anObject

]
