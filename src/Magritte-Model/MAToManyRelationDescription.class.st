"
I am a description of an one-to-many relationship, possible values are instances of ==Collection==.
"
Class {
	#name : #MAToManyRelationDescription,
	#superclass : #MARelationDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAToManyRelationDescription class >> defaultDefinitive [
	^ false
]

{ #category : #'accessing-defaults' }
MAToManyRelationDescription class >> defaultKind [
	^ Collection
]

{ #category : #'accessing-defaults' }
MAToManyRelationDescription class >> defaultOrdered [
	^ false
]

{ #category : #'accessing-defaults' }
MAToManyRelationDescription class >> defaultSorted [
	^ false
]

{ #category : #testing }
MAToManyRelationDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAToManyRelationDescription class >> label [
	^ '1:m Relation'
]

{ #category : #visiting }
MAToManyRelationDescription >> acceptMagritte: aVisitor [
	aVisitor visitToManyRelationDescription: self
]

{ #category : #actions }
MAToManyRelationDescription >> beDefinitive [
	self definitive: true
]

{ #category : #actions }
MAToManyRelationDescription >> beModifiable [
	self definitive: false
]

{ #category : #actions }
MAToManyRelationDescription >> beOrdered [
	self ordered: true
]

{ #category : #actions }
MAToManyRelationDescription >> beSorted [
	self sorted: true
]

{ #category : #actions }
MAToManyRelationDescription >> beUnordered [
	self ordered: false
]

{ #category : #actions }
MAToManyRelationDescription >> beUnsorted [
	self sorted: false
]

{ #category : #'accessing-properties' }
MAToManyRelationDescription >> definitive [
	"Return true if the field is non-modifiable"

	^ self propertyAt: #definitive ifAbsent: [ self class defaultDefinitive ]
]

{ #category : #'accessing-properties' }
MAToManyRelationDescription >> definitive: aBoolean [
	self propertyAt: #definitive put: aBoolean
]

{ #category : #'acessing-magritte' }
MAToManyRelationDescription >> descriptionDefinitive [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #definitive;
		label: 'Definitive';
		priority: 265;
		default: self class defaultDefinitive;
		yourself
]

{ #category : #'acessing-magritte' }
MAToManyRelationDescription >> descriptionOrdered [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #ordered;
		label: 'Ordered';
		priority: 260;
		default: self class defaultOrdered;
		yourself
]

{ #category : #'acessing-magritte' }
MAToManyRelationDescription >> descriptionSorted [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #sorted;
		label: 'Sorted';
		priority: 240;
		default: self class defaultSorted;
		yourself
]

{ #category : #testing }
MAToManyRelationDescription >> isDefinitive [
	"Return true if the field is non-modifiable"

	^ self definitive.
]

{ #category : #testing }
MAToManyRelationDescription >> isOrdered [
	^ self ordered
]

{ #category : #testing }
MAToManyRelationDescription >> isSorted [
	^ self sorted
]

{ #category : #'accessing-properties' }
MAToManyRelationDescription >> ordered [
	^ self propertyAt: #ordered ifAbsent: [ self class defaultOrdered ]
]

{ #category : #'accessing-properties' }
MAToManyRelationDescription >> ordered: aBoolean [
	self propertyAt: #ordered put: aBoolean
]

{ #category : #'accessing-properties' }
MAToManyRelationDescription >> sorted [
	^ self propertyAt: #sorted ifAbsent: [ self class defaultSorted ]
]

{ #category : #'accessing-properties' }
MAToManyRelationDescription >> sorted: aBoolean [
	self propertyAt: #sorted put: aBoolean
]

{ #category : #validating }
MAToManyRelationDescription >> validateKind: anObject [
	super validateKind: anObject.
	anObject do: [ :object |
		(self classes anySatisfy: [ :class | object species includesBehavior: class ])
			ifFalse: [ MAKindError description: self signal: self kindErrorMessage ] ]
]

{ #category : #validating }
MAToManyRelationDescription >> validateRequired: anObject [
	super validateRequired: anObject.
	(self isRequired and: [ anObject isCollection and: [ anObject isEmpty ] ])
		ifTrue: [ MARequiredError description: self signal: self requiredErrorMessage ]
]
