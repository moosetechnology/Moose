"
I represent the state of an entity.
My main methods are:

	
"
Class {
	#name : #MooseEntityState,
	#superclass : #Object,
	#category : #'Moose-Core'
}

{ #category : #'instance creation' }
MooseEntityState class >> with: aMooseEntity [
	 
	^self new initialize: aMooseEntity
]

{ #category : #'accessing-properties' }
MooseEntityState >> allProperties [ 
	 
	"for read only uses, i.e. don't change he returned value"
	self subclassResponsibility
]

{ #category : #'accessing-attributes' }
MooseEntityState >> attributeAt: name ifAbsent: aBlock [ 
	 
	self subclassResponsibility
]

{ #category : #'accessing-attributes' }
MooseEntityState >> attributeAt: name ifAbsentPut: aBlock [ 
	 
	self subclassResponsibility
]

{ #category : #'accessing-attributes' }
MooseEntityState >> attributeAt: name put: value [ 
	 
	self subclassResponsibility
]

{ #category : #'accessing-properties' }
MooseEntityState >> cache: selector initializer: aBlock [
	^ self propertyAt: selector ifAbsentPut: [ aBlock cullValue: self entity ]
]

{ #category : #'accessing group' }
MooseEntityState >> cacheAt: name ifAbsent: aBlock [

	self subclassResponsibility 
]

{ #category : #'accessing group' }
MooseEntityState >> cacheAt: name ifAbsentPut: aBlock [

	self subclassResponsibility 
]

{ #category : #'accessing group' }
MooseEntityState >> cacheAt: name put: value [

	self subclassResponsibility 
]

{ #category : #'initialize-release' }
MooseEntityState >> clone: newOwner [
	| newState |
	newState := self copy.
	newState initialize: newOwner.
	^ newState
]

{ #category : #'accessing-common attributes' }
MooseEntityState >> description [
	| entity |
	^ self
		attributeAt: #privateDescription
		ifAbsent: [ entity := self entity.
			entity mooseName , ' (' , entity mooseDescription name , ')' ]
]

{ #category : #'accessing-common attributes' }
MooseEntityState >> description: text [
	^ self attributeAt: #privateDescription put: text
]

{ #category : #'initialize-release' }
MooseEntityState >> entity [
	
	^ self subclassResponsibility
]

{ #category : #accessing }
MooseEntityState >> entityCache [ 
	 
	self subclassResponsibility
]

{ #category : #controlling }
MooseEntityState >> flush [ 
	 
	self flushProperties. 
	self flushGroups
]

{ #category : #controlling }
MooseEntityState >> flushGroups [ 
	 
	self subclassResponsibility
]

{ #category : #controlling }
MooseEntityState >> flushProperties [ 
	 
	self subclassResponsibility
]

{ #category : #testing }
MooseEntityState >> includesKey: selector [ 
	 
	self subclassResponsibility
]

{ #category : #'initialize-release' }
MooseEntityState >> initialize: aMooseEntity [ 
	 
	self subclassResponsibility
]

{ #category : #'accessing-common attributes' }
MooseEntityState >> isStub [
	^ self attributeAt: #privateIsStub ifAbsent: [ false ]
]

{ #category : #'accessing-common attributes' }
MooseEntityState >> isStub: boolean [ 
	 
	^self attributeAt: #privateIsStub put: boolean
]

{ #category : #'accessing-properties' }
MooseEntityState >> propertyAt: name ifAbsent: aBlock [ 
	 
	self subclassResponsibility.
]

{ #category : #'accessing-properties' }
MooseEntityState >> propertyAt: name ifAbsentPut: aBlock [ 
	 
	self subclassResponsibility.
]

{ #category : #'accessing-properties' }
MooseEntityState >> propertyAt: name put: value [
	 
	self subclassResponsibility.
]

{ #category : #accessing }
MooseEntityState >> removeProperty: aKey [ 
	self subclassResponsibility
]
