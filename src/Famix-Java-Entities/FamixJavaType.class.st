Class {
	#name : #FamixJavaType,
	#superclass : #FamixJavaContainerEntity,
	#traits : 'FamixTClassHierarchyNavigation + FamixTParameterizedTypeUser + FamixTType + FamixTWithTypeAliases',
	#classTraits : 'FamixTClassHierarchyNavigation classTrait + FamixTParameterizedTypeUser classTrait + FamixTType classTrait + FamixTWithTypeAliases classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaType class >> annotation [

	<MSEClass: #Type super: #FamixJavaContainerEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaType class >> requirements [

	<generated>
	^ { FamixJavaContainerEntity }
]

{ #category : #'Famix-Java' }
FamixJavaType >> allAnnotationInstances [
	| result |
	result := OrderedCollection new.
	result addAll: self annotationInstances.
	result addAll: (self methods flatCollect: [ :each | each annotationInstances ]).
	^ result 
]

{ #category : #'Famix-Extensions' }
FamixJavaType >> allAnnotationTypes [
	^ self allAnnotationInstances collectAsSet: #annotationType
]

{ #category : #accessing }
FamixJavaType >> anySuperclass [
"Mircea: this used to return interfaces too. fixed now. 
	also added superclass that does the same thing"

	self
		allSuperclassesDo: [ :each | 
			each isInterface
				ifFalse: [ ^ each ] ].
	^ nil
]

{ #category : #accessing }
FamixJavaType >> belongsTo [
	^ self container ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FamixJavaType >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]

{ #category : #accessing }
FamixJavaType >> container [

	<MSEProperty: #container type: #FamixJavaContainerEntity>
	<MSEComment: 'Deprected, use typeContainer'>
	<container>
	<derived>

	^ self typeContainer
]

{ #category : #accessing }
FamixJavaType >> container: aContainer [

	self typeContainer: aContainer
]

{ #category : #testing }
FamixJavaType >> hasMethodWithSignature: aStringOrSymbol [
	| symbol |
	symbol := aStringOrSymbol asSymbol.
	^self methods anySatisfy: [:each | each signature asSymbol = symbol]
]

{ #category : #testing }
FamixJavaType >> hasMethodsAnnotatedWith: aString [
	^ self methods anySatisfy: [ :each | each isAnnotatedWith: aString ]
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #'Famix-Java' }
FamixJavaType >> implementedInterfaces [

	^ self directSuperclasses select: #isInterface
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> implements: aString [
	^ self methods
		anySatisfy: [ :each | aString = each signature	 "was changed from match: for performances and because signature is case sensitive" ]
]

{ #category : #accessing }
FamixJavaType >> incomingAccesses [
	^ self privateState 
		cacheAt: #incomingAccesses
		ifAbsentPut: [ attributes flatCollect: [ :each | each incomingAccesses ] ]
]

{ #category : #'Famix-Extensions' }
FamixJavaType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean> <derived>
	<MSEComment: 'Flag true for abstract classes.'>
	
	^super isAbstract
]

{ #category : #testing }
FamixJavaType >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #testing }
FamixJavaType >> isInnerClass [
	<MSEProperty: #isInnerClass type: #Boolean>
	<derived>
	<MSEComment:
		'True if the method is considered as an innerclass (i.e. is contained elsewhere than a java package: class, method, enum,...)'>
	^ self container ifNotNil: [ :c | c isNamespace not ] ifNil: [ false ]
]

{ #category : #testing }
FamixJavaType >> isInterface [
	^ false
]

{ #category : #testing }
FamixJavaType >> isJUnit3TestCase [
	^ self superclassHierarchy anySatisfy: [:each | each mooseName =  #'junit::framework::TestCase']
]

{ #category : #testing }
FamixJavaType >> isJUnit4TestCase [
	<MSEProperty: #isJUnit4TestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self methods anySatisfy: [ :m | m isJUnit4Test ]
]

{ #category : #testing }
FamixJavaType >> isLonelyWithin: aClassGroup [
	^ ( self subclassHierarchyGroup intersection: aClassGroup ) isEmpty and: [
		( self superclassHierarchyGroup intersection: aClassGroup ) isEmpty ]
]

{ #category : #testing }
FamixJavaType >> isParameterType [
	^ false
]

{ #category : #testing }
FamixJavaType >> isParameterizedType [
	^ false
]

{ #category : #testing }
FamixJavaType >> isTestCase [
	<MSEProperty: #isTestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Java test'>
	^ self isJUnit3TestCase or: [ self isJUnit4TestCase ] 
]

{ #category : #'Famix-Extensions-operations' }
FamixJavaType >> lookUp: aMethodSignature [ 
	"Returns the first method that has as signature #aMethodSignature. 
	The search starts from the receiver's methods and traveses the inherited methods from the receiver's superclasses heirarchy.
	If such a method has not been found, it returns nil"

	| c toSearchIt searchedM |
	c := self.
	searchedM := nil.
	toSearchIt := true.
	[c notNil and: [toSearchIt]] whileTrue: 
			[searchedM := c methods 
						detect: [:m | m signature = aMethodSignature]
						ifNone: [nil].
			searchedM
				ifNil: [c := c superclass]
				ifNotNil: [toSearchIt := false]
			].
	^searchedM
]

{ #category : #accessing }
FamixJavaType >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self container
]

{ #category : #printing }
FamixJavaType >> printOn: aStream [ 
	| parent |
	
	self name ifNotNil: [ aStream nextPutAll: self name ].
	parent := self container.
	parent ifNotNil: [ 
		aStream nextPutAll: ' in '.
		parent mooseNameOn: aStream ].
	aStream 
		nextPutAll: ' (';
		nextPutAll: (self class name removePrefix: 'FamixJava');
		nextPutAll: ')'
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [:each | 
		(each implements: signature) ifTrue: [^true]].
	^false
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> withSuperclassHierarchyGroup [
	<navigation: 'With all superclasses'>
	^ MooseGroup
		withAll: self withSuperclassHierarchy asSet
		withDescription: 'With all superclasses of ' , self mooseName
]
