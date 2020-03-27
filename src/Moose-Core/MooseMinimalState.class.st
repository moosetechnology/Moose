"
Is a kind of NullPattern
"
Class {
	#name : #MooseMinimalState,
	#superclass : #MooseEntityState,
	#classInstVars : [
		'singelton'
	],
	#category : #'Moose-Core'
}

{ #category : #'instance creation' }
MooseMinimalState class >> new [ 
	 
	^self uniqueInstance
]

{ #category : #'instance creation' }
MooseMinimalState class >> uniqueInstance [ 
	 
	^singelton ifNil: [singelton := self basicNew]
]

{ #category : #accessing }
MooseMinimalState >> allProperties [ 
	 
	^#()
]

{ #category : #accessing }
MooseMinimalState >> attributeAt: name ifAbsent: aBlock [ 
	 
	^aBlock value
]

{ #category : #accessing }
MooseMinimalState >> attributeAt: name ifAbsentPut: aBlock [ 
	 
	self nullStateError
]

{ #category : #accessing }
MooseMinimalState >> attributeAt: name put: value [ 
	 
	self nullStateError
]

{ #category : #accessing }
MooseMinimalState >> cacheAt: name ifAbsent: aBlock [
	^ aBlock value
]

{ #category : #accessing }
MooseMinimalState >> cacheAt: name ifAbsentPut: value [
	^ self nullStateError
]

{ #category : #accessing }
MooseMinimalState >> cacheAt: name put: value [
	self nullStateError
]

{ #category : #accessing }
MooseMinimalState >> entity [
	self nullStateError
]

{ #category : #accessing }
MooseMinimalState >> entityCache [ 
	 
	^self
]

{ #category : #controlling }
MooseMinimalState >> flushGroups [ 
	"do nothing" 
	 
	
]

{ #category : #controlling }
MooseMinimalState >> flushProperties [ 
	"do nothing" 
	 
	
]

{ #category : #testing }
MooseMinimalState >> includesKey: selector [ 
	" *** This method was defined by SCG.Moose.EntityState as a subclass responsibility. 
	Replace its body with a proper implementation. *** " 
	 
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
MooseMinimalState >> initialize: aMooseEntity [ 
	"do nothing" 
	 
	
]

{ #category : #'accessing-common attributes' }
MooseMinimalState >> isStub [ 
	 
	^false
]

{ #category : #'accessing-common attributes' }
MooseMinimalState >> isStub: boolean [ 
	 
	[boolean == false] assert
]

{ #category : #error }
MooseMinimalState >> nullStateError [
	self flag: #todo.	"Use a first class error."
	self error: 'You cannot store elements inside a minimal state'
]

{ #category : #accessing }
MooseMinimalState >> propertyAt: name ifAbsent: aBlock [
	^ aBlock value
]

{ #category : #accessing }
MooseMinimalState >> propertyAt: name ifAbsentPut: aBlock [
	self nullStateError
]

{ #category : #accessing }
MooseMinimalState >> propertyAt: name put: value [
	self nullStateError
]

{ #category : #accessing }
MooseMinimalState >> removeProperty: name [
]
