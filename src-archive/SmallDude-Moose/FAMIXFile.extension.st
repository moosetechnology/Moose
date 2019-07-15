Extension { #name : #FAMIXFile }

{ #category : #'*SmallDude-Moose-public interface' }
FAMIXFile >> allExternalDuplications [ 
	 
	<navigation: 'All external duplications'> 
	^DudeDuplicationGroup 
		withAll: 
			(self mooseModel allDuplications 
				select: 
					[:dup | (dup isSelfDuplicationOf: self) not and: [dup isDuplicationOf: self]]) 
		withDescription: 'All external duplications of file ' , self mooseName
]

{ #category : #'*SmallDude-Moose-public interface' }
FAMIXFile >> allExternalFiles [ 
	 
	<navigation: 'All files with fragments duplicated here'> 
	| files | 
	files := OrderedCollection new. 
	self allExternalDuplications 
		do: 
			[:dup |  
			| other | 
			other := dup referenceCode entity. 
			self ~= other 
				ifTrue: 
					[files 
						indexOf: other 
						ifAbsent: [files add: other]]. 
			other := dup duplicateCode entity. 
			self ~= other 
				ifTrue: 
					[files 
						indexOf: other 
						ifAbsent: [files add: other]]]. 
	^MooseGroup 
		withAll: files 
		withDescription: 
			'All files with parts duplicated in this file ' , self mooseName
]

{ #category : #'*SmallDude-Moose-public interface' }
FAMIXFile >> allInternalDuplications [ 
	 
	<navigation: 'All internal duplications'> 
	^DudeDuplicationGroup 
		withAll: 
			(self mooseModel allDuplications 
				select: [:dup | dup isSelfDuplicationOf: self]) 
		withDescription: 'All internal duplications of file ' , self mooseName
]

{ #category : #'*SmallDude-Moose-public interface' }
FAMIXFile >> allInternalMultiplications [ 
	 
	<navigation: 'All internal multiplications'> 
	| originals | 
	originals := self mooseModel allMultiplications. 
	^originals isEmpty 
		ifFalse: [originals select: [:each | each isInternalTo: self]] 
		ifTrue: [DudeMultiplicationGroup new]
]

{ #category : #'*SmallDude-Moose-private' }
FAMIXFile >> externalFragments [
	| externalDups |
	externalDups := self allExternalDuplications.
	^ externalDups notEmpty
		ifTrue: [ externalDups distinctFragments ]
		ifFalse: [ OrderedCollection new ]
]

{ #category : #'*SmallDude-Moose-private' }
FAMIXFile >> internalFragments [
	| internalDups |
	internalDups := self allInternalDuplications.
	^ internalDups notEmpty
		ifTrue: [ internalDups distinctFragments ]
		ifFalse: [ OrderedCollection new ]
]

{ #category : #'*SmallDude-Moose-properties' }
FAMIXFile >> numberOfDuplicatedFiles [
	<MSEProperty: #numberOfDuplicatedFiles type: #Number>
	<MSEComment: 'The number of distinct files that contain fragments duplicated in this file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfDuplicatedFiles computedAs: [ self allExternalFiles size ]
]

{ #category : #'*SmallDude-Moose-properties' }
FAMIXFile >> numberOfExternalClones [
	<MSEProperty: #numberOfExternalClones type: #Number>
	<MSEComment: 'The number of fragments in this file cloned in other files'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfExternalClones computedAs: [ self externalFragments size ]
]

{ #category : #'*SmallDude-Moose-properties' }
FAMIXFile >> numberOfExternalDuplications [
	<MSEProperty: #numberOfExternalDuplications type: #Number>
	<MSEComment: 'The number of pairs of duplicate fragments between this file and other files'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfExternalDuplications computedAs: [ self allExternalDuplications size ]
]

{ #category : #'*SmallDude-Moose-properties' }
FAMIXFile >> numberOfInternalClones [
	<MSEProperty: #numberOfInternalClones type: #Number>
	<MSEComment: 'The number of cloned fragments within the file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfInternalClones computedAs: [ self internalFragments size ]
]

{ #category : #'*SmallDude-Moose-properties' }
FAMIXFile >> numberOfInternalDuplications [
	<MSEProperty: #numberOfInternalDuplications type: #Number>
	<MSEComment: 'The number of pairs of duplicate fragments within the file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfInternalDuplications computedAs: [ self allInternalDuplications size ]
]

{ #category : #'*SmallDude-Moose-properties' }
FAMIXFile >> numberOfInternalMultiplications [
	<MSEProperty: #numberOfInternalMultiplications type: #Number>
	<MSEComment: 'The number of original fragments duplicated internally'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfInternalMultiplications computedAs: [ self allInternalMultiplications size ]
]
