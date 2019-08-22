Trait {
	#name : #FamixTWithMethods,
	#instVars : [
		'#methods => FMMany type: #FamixTMethod opposite: #parentType'
	],
	#category : #'Famix-Traits-Method'
}

{ #category : #meta }
FamixTWithMethods classSide >> annotation [

	<MSEClass: #TWithMethods super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithMethods >> addMethod: aMethod [
	methods add: aMethod
]

{ #category : #accessing }
FamixTWithMethods >> methods [
	"Relation named: #methods type: #FamixTMethod opposite: #parentType"

	<generated>
	<MSEComment: 'Methods declared by this type.'>
	^ methods
]

{ #category : #accessing }
FamixTWithMethods >> methods: anObject [

	<generated>
	methods value: anObject

]

{ #category : #accessing }
FamixTWithMethods >> methodsGroup [
	<navigation: 'Methods'>
	^MooseGroup
		withAll: self methods
		withDescription: 'Methods from ' , self mooseName
]

{ #category : #metrics }
FamixTWithMethods >> numberOfAccessorMethods [
	<MSEProperty: #numberOfAccessorMethods type: #Number>
	<derived>
	<MSEComment: 'The number of accessor methods in a class'>
	^ self
		lookUpPropertyNamed: #numberOfAccessorMethods
		computedAs: [ 
			| noa |
			noa := 0.
			self methods
				do: [ :method | 
					method isPureAccessor
						ifNotNil: [ 
							(method isPureAccessor or: [ (method propertyNamed: #AccessorMethod) isNil not ])
								ifTrue: [ noa := noa + 1 ] ] ].
			noa ]
]

{ #category : #metrics }
FamixTWithMethods >> numberOfAccessorMethods: aNumber [

	self privateState propertyAt: #numberOfAccessorMethods put: aNumber
]

{ #category : #metrics }
FamixTWithMethods >> numberOfConstructorMethods [
	<MSEProperty: #numberOfConstructorMethods type: #Number>
	<derived>
	<MSEComment: 'The number of constructor methods in a class'>
	^ self
		lookUpPropertyNamed: #numberOfConstructorMethods
		computedAs: [ 
			| nc |
			nc := 0.
			self methods
				do: [ :method | 
					method isConstructor
						ifNotNil: [ 
							method isConstructor
								ifTrue: [ nc := 1 ] ] ].
			nc ]
]

{ #category : #metrics }
FamixTWithMethods >> numberOfConstructorMethods: aNumber [

	self privateState propertyAt: #numberOfConstructorMethods put: aNumber
]

{ #category : #metrics }
FamixTWithMethods >> numberOfLinesOfCode [

	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<MSEComment: 'The number of lines of code in a class'>

	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [self methodsGroup sumNumbers: #numberOfLinesOfCode]
]

{ #category : #metrics }
FamixTWithMethods >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]

{ #category : #metrics }
FamixTWithMethods >> numberOfMessageSends [
	<MSEProperty: #numberOfMessageSends type: #Number>
	<derived>
	<MSEComment: 'The number of message sends from a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [self methodsGroup sumNumbers: #numberOfMessageSends]
]

{ #category : #metrics }
FamixTWithMethods >> numberOfMessageSends: aNumber [

	self privateState propertyAt: #numberOfMessageSends put: aNumber
]

{ #category : #metrics }
FamixTWithMethods >> numberOfMethodProtocols [
	<MSEProperty: #numberOfMethodProtocols type: #Number>
	<derived>
	<MSEComment: 'The number of method protocols in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMethodProtocols
		computedAs: [((self methods collect: [:each | each protocol]) reject: #isNil) asSet size]
]

{ #category : #metrics }
FamixTWithMethods >> numberOfMethodProtocols: aNumber [

	self privateState propertyAt: #numberOfMethodProtocols put: aNumber
]

{ #category : #accessing }
FamixTWithMethods >> numberOfMethods [
	<MSEProperty: #numberOfMethods type: #Number>
	<derived>
	<MSEComment: 'The number of methods in a class'>

	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self methods size]
]

{ #category : #accessing }
FamixTWithMethods >> numberOfMethods: aNumber [

	self privateState propertyAt: #numberOfMethods put: aNumber
]

{ #category : #metrics }
FamixTWithMethods >> weightedMethodCount [
	<MSEProperty: #weightedMethodCount type: #Number>
	<derived>
	<MSEComment: 'The sum of the complexity in a class'>
			
	^self
		lookUpPropertyNamed: #weightedMethodCount
		computedAs: [self methodsGroup sumNumbers: #cyclomaticComplexity]
]

{ #category : #metrics }
FamixTWithMethods >> weightedMethodCount: aNumber [

	self privateState propertyAt: #weightedMethodCount put: aNumber
]
