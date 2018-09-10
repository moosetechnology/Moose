"
I am a container holding a collection of descriptions, all instances of subclasses of *MAElementDescription*. I keep my children within an ==OrderedCollection==, but I don't sort them according to their priority.

I fully support the collection protocol: descriptions can be added and removed. Moreover I implement most enumeration methods, so that users are able to iterate (==do:==), filter (==select:==, ==reject:==), transform (==collect:==), extract (==detect:==, ==detect:ifNone:==), and test (==allSatisfy:==, ==anySatisfy:==, ==noneSatisfy:==) my elements.
"
Class {
	#name : #MAContainer,
	#superclass : #MADescription,
	#instVars : [
		'children'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAContainer class >> defaultAccessor [
	^ MAIdentityAccessor new
]

{ #category : #'accessing-defaults' }
MAContainer class >> defaultCollection [
	^ OrderedCollection new
]

{ #category : #testing }
MAContainer class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MAContainer class >> with: aDescription [
	^ self new
		add: aDescription;
		yourself
]

{ #category : #'instance creation' }
MAContainer class >> withAll: aCollection [
	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
MAContainer >> = anObject [
	^ super = anObject
		and: [ self children = anObject children ]
]

{ #category : #visiting }
MAContainer >> acceptMagritte: aVisitor [
	aVisitor visitContainer: self
]

{ #category : #adding }
MAContainer >> add: aDescription [
	self children add: aDescription
]

{ #category : #adding }
MAContainer >> addAll: aCollection [
	self children addAll: aCollection
]

{ #category : #enumerating }
MAContainer >> allSatisfy: aBlock [
	^ self children allSatisfy: aBlock
]

{ #category : #enumerating }
MAContainer >> anySatisfy: aBlock [
	^ self children anySatisfy: aBlock
]

{ #category : #converting }
MAContainer >> asContainer [
	^ self
]

{ #category : #accessing }
MAContainer >> at: anIndex [
	^ self children at: anIndex
]

{ #category : #accessing }
MAContainer >> at: anIndex ifAbsent: aBlock [
	^ self children at: anIndex ifAbsent: aBlock
]

{ #category : #accessing }
MAContainer >> children [
	^ children
]

{ #category : #enumerating }
MAContainer >> collect: aBlock [
	^ self copy
		setChildren: (self children collect: aBlock);
		yourself
]

{ #category : #copying }
MAContainer >> copyEmpty [
	^ self copy
		setChildren: self class defaultCollection;
		yourself
]

{ #category : #copying }
MAContainer >> copyFrom: aStartIndex to: anEndIndex [
	^ self copy
		setChildren: (self children
			copyFrom: aStartIndex
			to: anEndIndex);
		yourself
]

{ #category : #copying }
MAContainer >> copyWithout: anObject [
	^self reject: [:each | each = anObject]
]

{ #category : #copying }
MAContainer >> copyWithoutAll: aCollection [
	^self reject: [:each | aCollection includes: each]
]

{ #category : #builder }
MAContainer >> descriptionBuilder [
	^self propertyAt: #descriptionBuilder ifAbsent: [ nil ]
]

{ #category : #builder }
MAContainer >> descriptionBuilder: aBuilderClass [
	self propertyAt: #descriptionBuilder put: aBuilderClass
]

{ #category : #builder }
MAContainer >> descriptionBuilders [
	^self propertyAt: #descriptionBuilders ifAbsent: [ #() ]
]

{ #category : #builder }
MAContainer >> descriptionBuilders: aList [ 
	self descriptionBuilder: MAComposedDescriptionBuilder.
	self propertyAt: #descriptionBuilders put: aList
]

{ #category : #'acessing-magritte' }
MAContainer >> descriptionChildren [
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: (MASelectorAccessor read: #children write: #setChildren:);
		classes: MAElementDescription withAllConcreteClasses;
		default: self class defaultCollection;
		label: 'Elements';
		priority: 400;
		beOrdered;
		yourself
]

{ #category : #'acessing-magritte' }
MAContainer >> descriptionDefault [
	<magritteDescription>
	^ nil
]

{ #category : #enumerating }
MAContainer >> detect: aBlock [
	^ self children detect: aBlock
]

{ #category : #enumerating }
MAContainer >> detect: aBlock ifNone: anExceptionBlock [
	^ self children detect: aBlock ifNone: anExceptionBlock
]

{ #category : #enumerating }
MAContainer >> do: aBlock [
	self children do: aBlock
]

{ #category : #enumerating }
MAContainer >> do: aBlock separatedBy: aSeparatorBlock [
	self children do: aBlock separatedBy: aSeparatorBlock
]

{ #category : #private }
MAContainer >> errorNotFound: aDescription [
	self error: aDescription class label , ' not found.'
]

{ #category : #testing }
MAContainer >> hasChildren [
	^ self notEmpty
]

{ #category : #comparing }
MAContainer >> hash [
	^ super hash bitXor: self children hash
]

{ #category : #testing }
MAContainer >> includes: aDescription [
	^ self children includes: aDescription
]

{ #category : #initialization }
MAContainer >> initialize [
	super initialize.
	self setChildren: self class defaultCollection
]

{ #category : #enumerating }
MAContainer >> inject: anObject into: aBlock [
	^ self children inject: anObject into: aBlock
]

{ #category : #enumerating }
MAContainer >> intersection: aCollection [
	^ self copy
		setChildren: (self children intersection: aCollection);
		yourself
]

{ #category : #testing }
MAContainer >> isContainer [
	^ true
]

{ #category : #testing }
MAContainer >> isEmpty [
	^ self children isEmpty
]

{ #category : #enumerating }
MAContainer >> keysAndValuesDo: aBlock [
	self children keysAndValuesDo: aBlock
]

{ #category : #moving }
MAContainer >> moveDown: aDescription [
	self children moveDown: aDescription
]

{ #category : #moving }
MAContainer >> moveUp: aDescription [
	self children moveUp: aDescription
]

{ #category : #enumerating }
MAContainer >> noneSatisfy: aBlock [
	^ self children noneSatisfy: aBlock
]

{ #category : #testing }
MAContainer >> notEmpty [
	^ self children notEmpty
]

{ #category : #copying }
MAContainer >> postCopy [
	super postCopy.
	self setChildren: self children copy
]

{ #category : #enumerating }
MAContainer >> reject: aBlock [
	^ self copy
		setChildren: (self children reject: aBlock);
		yourself
]

{ #category : #removing }
MAContainer >> remove: aDescription [
	self children remove: aDescription ifAbsent: [ self errorNotFound: aDescription ]
]

{ #category : #removing }
MAContainer >> removeAll [
	self setChildren: self class defaultCollection
]

{ #category : #enumerating }
MAContainer >> select: aBlock [
	^ self copy
		setChildren: (self children select: aBlock);
		yourself
]

{ #category : #initialization }
MAContainer >> setChildren: aCollection [
	children := aCollection
]

{ #category : #accessing }
MAContainer >> size [
	^ self children size
]

{ #category : #enumerating }
MAContainer >> union: aContainer [
	^ self copy
		addAll: (aContainer reject: [ :each | self includes: each ]);
		yourself
]

{ #category : #enumerating }
MAContainer >> with: aCollection do: aBlock [
	self children with: aCollection do: aBlock
]
