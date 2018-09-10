Extension { #name : #FAMIXType }

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> classSide [
	^self isClassSide
		ifFalse:
			[self mooseModel allClasses
				entityNamed: (self mooseName , '_class') asSymbol]
		ifTrue: [self]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> extendedInPackages [

	^ self privateState cacheAt: #extendedInPackages
							ifAbsentPut: [ self extendedMethods collectAsSet: [ :m| m packageScope ] ]


]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> extendedMethods [
	"select methods which are class extensions in this class"

	^  self privateState cacheAt: #extendedMethods
							ifAbsentPut: [ self methods select: [ :m| m isExtension ] ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> instanceSide [
	^self isClassSide
		ifTrue:
			[self mooseModel allClasses
				entityNamed: (self mooseName removeSuffix: '_class') asSymbol]
		ifFalse: [self]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^'*_class' match: self name
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> isExtended [

	^ self methods anySatisfy: [ :m| m isExtension ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> isInstanceSide [
	^self isClassSide not
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> isSUnitTestCase [
	self allSuperclassesDo: [:each | each name = 'TestCase' ifTrue: [^ true] ].
	^ false
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> localMethods [
	"select all locally defined methods"

	^ self privateState cacheAt: #localMethods
							ifAbsentPut: [ self methods reject: [ :m| m isExtension ] ]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> numberOfMethodProtocols [
	<MSEProperty: #numberOfMethodProtocols type: #Number>
	<derived>
	<MSEComment: 'The number of method protocols in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMethodProtocols
		computedAs: [((self methods collect: [:each | each category]) reject: #isNil) asSet size]
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> numberOfMethodProtocols: aNumber [

	self privateState propertyAt: #numberOfMethodProtocols put: aNumber
]

{ #category : #'*Famix-Smalltalk' }
FAMIXType >> superclass [
	^self anySuperclass
]
