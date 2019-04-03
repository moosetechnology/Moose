Class {
	#name : #MooseGroupStorage,
	#superclass : #Collection,
	#type : #variable,
	#category : #'Moose-Core'
}

{ #category : #'instance creation' }
MooseGroupStorage class >> empty [
	^ MooseGroupRuntimeStorage new
]

{ #category : #'instance creation' }
MooseGroupStorage class >> new [ 
	 
	^self basicNew initialize: 1000
]

{ #category : #'instance creation' }
MooseGroupStorage class >> new: capacity [ 
	 
	^self basicNew initialize: capacity
]

{ #category : #'instance creation' }
MooseGroupStorage class >> withAll: aCollection [ 
	" Answer a new instance of this class, 
	whose elements are the elements of aCollection. " 
	 
	| newCollection | 
	newCollection := self new: aCollection size. 
	newCollection addAll: aCollection. 
	^newCollection
]

{ #category : #adding }
MooseGroupStorage >> add: anElement [ 
	 
	^self subclassResponsibility
]

{ #category : #enumerating }
MooseGroupStorage >> allEntityTypes [
	self subclassResponsibility
]

{ #category : #accessing }
MooseGroupStorage >> at: uniqueName [ 
	 
	^self 
		at: uniqueName asSymbol
		ifAbsent: [nil]
]

{ #category : #accessing }
MooseGroupStorage >> at: uniqueName ifAbsent: exceptionBlock [ 
	 
	^self subclassResponsibility
]

{ #category : #private }
MooseGroupStorage >> becomeKind: elementStorageClass [ 
	
	self class = elementStorageClass ifTrue: [ ^ self ].
	[elementStorageClass includesBehavior: MooseGroupStorage] assert.
	self do: [ :each | 
		each hasUniqueMooseNameInModel ifTrue: [ each privateClearMooseName ] ].
	self become: (elementStorageClass withAll: self)
]

{ #category : #enumerating }
MooseGroupStorage >> collect: aBlock [ 
	 
	| newCollection | 
	newCollection := OrderedCollection new: self size. 
	self do: [:each | newCollection add: (aBlock value: each)]. 
	^newCollection
]

{ #category : #enumerating }
MooseGroupStorage >> do: aBlock [ 
	 
	self subclassResponsibility
]

{ #category : #accessing }
MooseGroupStorage >> elements [ 
	 
	^self subclassResponsibility
]

{ #category : #converting }
MooseGroupStorage >> forRemoving [ 
	 
	self becomeKind: MooseGroupTeardownStorage
]

{ #category : #converting }
MooseGroupStorage >> forRuntime [ 
	 
	self becomeKind: MooseGroupRuntimeStorage
]

{ #category : #converting }
MooseGroupStorage >> forSetup [ 
	 
	self becomeKind: MooseGroupSetupStorage
]

{ #category : #testing }
MooseGroupStorage >> includesID: mooseID [ 
	 
	^self anySatisfy: [:each | mooseID == each mooseID]
]

{ #category : #initialization }
MooseGroupStorage >> initialize: aSize [
	self subclassResponsibility
]

{ #category : #removing }
MooseGroupStorage >> remove: anElement [ 
	 
	^self 
		remove: anElement 
		ifAbsent: [anElement]
]

{ #category : #removing }
MooseGroupStorage >> remove: anElement ifAbsent: exceptionBlock [ 
	 
	^self subclassResponsibility
]

{ #category : #removing }
MooseGroupStorage >> removeAll [ 
	 
	^self subclassResponsibility
]

{ #category : #private }
MooseGroupStorage >> resetMooseNameFor: anEntity [
	anEntity privateClearMooseName
]

{ #category : #enumerating }
MooseGroupStorage >> selectAllWithType: aSmalltalkClass [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
MooseGroupStorage >> size [ 
	 
	^self subclassResponsibility
]

{ #category : #private }
MooseGroupStorage >> species [ 
	 
	^OrderedCollection
]
