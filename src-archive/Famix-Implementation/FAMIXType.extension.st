Extension { #name : #FAMIXType }

{ #category : #'*Famix-Implementation' }
FAMIXType >> addedMethods [
	| inheritedMethodNames |
	inheritedMethodNames := self inheritedMethods
		collect: [:each | each signature].
	^self methods
		reject: [:each | inheritedMethodNames includes: each signature]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> allSubclassesDo: aBlock [
	self allSubclassesWithoutAliasesDo: aBlock.
	self typeAliases do: [ :each | each allSubclassesWithoutAliasesDo: aBlock ]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> allSubclassesWithoutAliasesDo: aBlock [
	self subInheritances do: [ :each | aBlock value: each subclass ].
	self subInheritances do: [ :each | each subclass allSubclassesDo: aBlock ]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> allSuperclassesDo: aBlock [
	self allSuperclassesWithoutAliasesDo: aBlock.
	self mooseModel sourceLanguage isC
		ifTrue: [ self typeAliases do: [ :each | each allSuperclassesWithoutAliasesDo: aBlock ] ]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> allSuperclassesWithoutAliasesDo: aBlock [
	superInheritances do: [:each | aBlock value: each superclass].
	superInheritances do: [:each | each superclass allSuperclassesDo: aBlock]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> allTypeAliases [
	| all |
	all := OrderedCollection withAll: self typeAliases.
	self typeAliases do: [:each | all addAll: each allTypeAliases ].
	^ all
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> anySuperclass [
	"Mircea: this used to return interfaces too. fixed now. 
	also added superclass that does the same thing"

	self
		allSuperclassesDo: [ :each | 
			each isInterface
				ifFalse: [ ^ each ] ].
	^ nil
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> directSubclasses [
	"returns a collection with all subclasses of this class"

	^ self subInheritances collect: [:each | each subclass]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> directSuperclasses [
	"returns a collection with all superclasses of this class"

	^ self superInheritances collect: [:each | each superclass]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> implements: aString [
	^ self methods
		anySatisfy: [ :each | aString = each signature	 "was changed from match: for performances and because signature is case sensitive" ]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> inheritedAttributes [
	| inheritedAttrs |
	inheritedAttrs := OrderedCollection new.
	self allSuperclassesDo: [:each | 
			each attributes do: [:attr | 
				attr isPrivate not ifTrue: [inheritedAttrs add: attr]]].
	^ inheritedAttrs
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> inheritedMethods [
	| inheritedMethods |
	inheritedMethods := OrderedCollection new.
	self allSuperclassesDo: [:each | 
			each methodsDo: [:method | 
				method isPrivate not ifTrue: [inheritedMethods add: method]]].
	^inheritedMethods
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> inheritedSignatures [
	| inheritedSignatures |
	inheritedSignatures := Set new.
	self superclassHierarchy do: [:each | 
			each methodsDo: [:method | 
				method isPrivate not ifTrue: [inheritedSignatures add: method signature]]].
	^ inheritedSignatures
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> inheritedSignaturesToMethod [
	| inheritedSignaturesToMethod |
	inheritedSignaturesToMethod := Dictionary new.
	self allSuperclassesDo: [:each | 
			each methodsDo: [:method | 
				method isPrivate ifFalse: [
					inheritedSignaturesToMethod at: method signature ifAbsentPut: [method]]]].
	^ inheritedSignaturesToMethod
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> inheritsFrom: aClass [
	self allSuperclassesDo: [:each | each = aClass ifTrue: [^true]].
	^ false
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> isType [
	^ true
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> methodsDo: aBlock [
	self methods do: aBlock
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> methodsGroup [
	<navigation: 'Methods'>
	^MooseGroup
		withAll: self methods
		withDescription: 'Methods from ' , self mooseName
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> mooseNameOn: aStream [ 
	| parent |
	parent := self container.
	parent ifNotNil: 
		[ 
			parent mooseNameOn: aStream.
			aStream
				nextPut: $:;
				nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self container
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> printOn: aStream [ 
	| parent |
	
	self name ifNotNil: [ aStream nextPutAll: self name ].
	parent := self container.
	parent ifNotNil: [ 
		aStream nextPutAll: ' in '.
		parent mooseNameOn: aStream ].
	aStream 
		nextPutAll: ' (';
		nextPutAll: (self class name removePrefix: 'FAMIX');
		nextPutAll: ')'
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> realType [
	"All types except the alias ones are real"
	^ self 
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> subclassHierarchy [
	| subclasses |
	subclasses := OrderedCollection new.
	self allSubclassesDo: [:each | subclasses add: each].
	^ subclasses
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> subclassHierarchyGroup [
	<navigation: 'All subclasses'>
	^ MooseGroup
		withAll: self subclassHierarchy asSet
		withDescription: 'All subclasses of ' , self mooseName
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> superclassHierarchy [
	| superclasses |
	superclasses := OrderedCollection new.
	self allSuperclassesDo: [:each |  superclasses add: each].
	^ superclasses
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> superclassHierarchyGroup [
	<navigation: 'All superclasses'>
	^ MooseGroup
		withAll: self superclassHierarchy asSet
		withDescription: 'All superclasses of ' , self mooseName
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [:each | 
		(each implements: signature) ifTrue: [^true]].
	^false
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> withSubclassHierarchy [
	^ self subclassHierarchy 
		addFirst: self realType;
		addAll: self realType allTypeAliases;
		yourself
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> withSubclassHierarchyGroup [
	<navigation: 'With all subclasses'>
	^ MooseGroup
		withAll: (self subclassHierarchy asSet; addFirst: self; yourself)
		withDescription: 'With all subclasses of ' , self mooseName
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> withSubclassesDo: aBlock [
	aBlock value: self.
	self allSubclassesDo: aBlock
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> withSuperclassHierarchy [
	^ self realType superclassHierarchy 
		addFirst: self realType; 
		addAll: self realType allTypeAliases;
		yourself
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> withSuperclassHierarchyGroup [
	<navigation: 'With all superclasses'>
	^ MooseGroup
		withAll: self withSuperclassHierarchy asSet
		withDescription: 'With all superclasses of ' , self mooseName
]

{ #category : #'*Famix-Implementation' }
FAMIXType >> withSuperclassesDo: aBlock [
	aBlock value: self.
	self allSuperclassesDo: aBlock
]
