Extension { #name : #FAMIXMethod }

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> compiledMethod [
	"Return the compiled method associated to the receiver or nil"
	
	^ self smalltalkClass  compiledMethodAt: self name asSymbol
	
	
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isClassInitializer [
	<MSEProperty: #isClassInitializer type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is an initializer of the class (i.e. contains the attribute init env)'>
	^ #initializer = self kind
		or: [ self privateState propertyAt: #isClassInitializer ifAbsent: [ false ] ]
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isConstant [
	<MSEProperty: #isConstant type: #Boolean>
	<derived>
	<MSEComment: 'True if the method simply returns a constant'>
	^#constant = self kind
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isConstructor [
	<MSEProperty: #isConstructor type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is a constructor of the class'>

	^ #constructor = self kind or: [ 
		self privateState propertyAt: #isConstructor ifAbsent: [false] ]
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isConstructor: aBoolean [
	aBoolean 
		ifTrue: [ self kind: #constructor ]
		ifFalse: [ 
			self isConstructor ifTrue: [ self kind: nil ] ]
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isGetter [
	<MSEProperty: #isGetter type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is a getter of an attribute'>
	
	^#getter = self kind
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isMethod [

	^ true
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isPureAccessor [
	^self isGetter
		or: [self isSetter
		or: [self privateState propertyAt: #isPureAccessor ifAbsent: [false]]]
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> isSetter [
	<MSEProperty: #isSetter type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is a setter on an attribute'>

	^#setter = self kind
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> mooseNameOn: stream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self signature
		ifNotNil: [ stream nextPutAll: self signature ]
		ifNil: [ 
			self name ifNotNil: [ stream nextPutAll: self name] ]
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> overridesMethod [
	^ self belongsTo superclassHierarchy collect: [ :each | each implementationOf: self signature ] thenSelect: #isNotNil
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self parentType parentScope
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> printOn: aStream [
	parentType ifNotNil: [ aStream nextPutAll: parentType name ].
	aStream nextPutAll: '>>'.
	signature ifNotNil: [ aStream nextPutAll: signature ].
	aStream nextPutAll: ' (Method)'
]

{ #category : #'*Famix-Implementation' }
FAMIXMethod >> smalltalkClass [ 
	"Return the smalltalk class associated with the receiver. Note that it may be different than doing self parentType because the class and metaclass can be merged."
	
	^   ('*_class' match: self parentType name)
			ifTrue: [self parentType smalltalkClass]
			ifFalse: [self hasClassScope 
							ifTrue: [self parentType smalltalkClass class]
							ifFalse: [self parentType smalltalkClass]]
]
