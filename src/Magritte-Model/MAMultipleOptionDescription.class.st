"
I am a description of multiple options, possible options are stored within the ==options== field, possible values are instances of ==Collection==. My visual representation could be a multi-select list or a group of check-boxes.
"
Class {
	#name : #MAMultipleOptionDescription,
	#superclass : #MAOptionDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAMultipleOptionDescription class >> defaultDistinct [
	^ false
]

{ #category : #'accessing-defaults' }
MAMultipleOptionDescription class >> defaultKind [
	^ Collection
]

{ #category : #'accessing-defaults' }
MAMultipleOptionDescription class >> defaultOrdered [
	^ false
]

{ #category : #testing }
MAMultipleOptionDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAMultipleOptionDescription class >> label [
	^ 'Multiple-Option'
]

{ #category : #visiting }
MAMultipleOptionDescription >> acceptMagritte: aVisitor [
	aVisitor visitMultipleOptionDescription: self
]

{ #category : #actions }
MAMultipleOptionDescription >> beDistinct [
	self distinct: true
]

{ #category : #actions }
MAMultipleOptionDescription >> beIndefinite [
	self distinct: false
]

{ #category : #actions }
MAMultipleOptionDescription >> beOrdered [
	self ordered: true
]

{ #category : #actions }
MAMultipleOptionDescription >> beUnordered [
	self ordered: false
]

{ #category : #'acessing-magritte' }
MAMultipleOptionDescription >> descriptionDistinct [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #distinct;
		label: 'Distinct';
		priority: 250;
		default: self class defaultDistinct;
		yourself
]

{ #category : #'acessing-magritte' }
MAMultipleOptionDescription >> descriptionOrdered [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #ordered;
		label: 'Ordered';
		priority: 260;
		default: self class defaultOrdered;
		yourself
]

{ #category : #'accessing-properties' }
MAMultipleOptionDescription >> distinct [
	^ self propertyAt: #distinct ifAbsent: [ self class defaultDistinct ]
]

{ #category : #'accessing-properties' }
MAMultipleOptionDescription >> distinct: aBoolean [
	self propertyAt: #distinct put: aBoolean
]

{ #category : #testing }
MAMultipleOptionDescription >> isDistinct [
	^ self distinct
]

{ #category : #testing }
MAMultipleOptionDescription >> isMultiple [
	^true
]

{ #category : #testing }
MAMultipleOptionDescription >> isOrdered [
	^ self ordered
]

{ #category : #'accessing-properties' }
MAMultipleOptionDescription >> ordered [
	^ self propertyAt: #ordered ifAbsent: [ self class defaultOrdered ]
]

{ #category : #'accessing-properties' }
MAMultipleOptionDescription >> ordered: aBoolean [
	self propertyAt: #ordered put: aBoolean
]

{ #category : #validating }
MAMultipleOptionDescription >> validateKind: anObject [
	super validateKind: anObject.
	anObject do: [ :e | self validateOptionKind: e ]
]

{ #category : #validating }
MAMultipleOptionDescription >> validateRequired: anObject [
	super validateRequired: anObject.
	(self isRequired and: [ anObject isCollection and: [ anObject isEmpty ] ])
		ifTrue: [ MARequiredError description: self signal: self requiredErrorMessage ]
]
