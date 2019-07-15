Extension { #name : #FAMIXClass }

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> allDuplicatingClasses [ 
	 
	<navigation: 'Classes with fragments duplicated here'> 
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
		withDescription: 'All classes with parts duplicated in ' , self mooseName
]

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> allExternalDuplications [ 
	 
	<navigation: 'External duplications'> 
	^DudeDuplicationGroup 
		withAll: 
			((self mooseModel ifNil: [ MooseModel new ]) allDuplications 
				select: 
					[:dup | (dup isSelfDuplicationOf: self) not and: [dup isDuplicationOf: self]]) 
		withDescription: 'All external duplications of ' , self mooseName
]

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> allExternalMultiplications [ 
	 
	<navigation: 'External multiplications'> 
	^DudeMultiplicationGroup 
		withAll: 
			((self mooseModel ifNil: [MooseModel new]) 
				allMultiplications select: 
					[:each | (each isInternalTo: self) not and: [each isMultiplicationOf: self]]) 
		withDescription: 'All external multiplications of ' , self mooseName
]

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> allInternalDuplications [ 
	 
	<navigation: 'Internal duplications'> 
	^DudeDuplicationGroup 
		withAll: 
			((self mooseModel ifNil: [ MooseModel new ]) allDuplications 
				select: [:dup | dup isSelfDuplicationOf: self]) 
		withDescription: 'All internal duplications of ' , self mooseName
]

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> allInternalMultiplications [ 
	 
	<navigation: 'Internal multiplications'> 
	^DudeMultiplicationGroup 
		withAll: 
			((self mooseModel ifNil: [MooseModel new]) 
				allMultiplications 
				select: [:each | each isInternalTo: self]) 
		withDescription: 'All internal multiplications of ' , self mooseName
]

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> allMultiplications [ 
	 
	<navigation: 'All multiplications'> 
	^DudeMultiplicationGroup 
		withAll: 
			((self mooseModel ifNil: [ MooseModel new ]) 
				allMultiplications 
					select: [:each | each isMultiplicationOf: self]) 
		withDescription: 'All multiplications of ' , self mooseName
]

{ #category : #'*SmallDude-Moose-testing' }
FAMIXClass >> isMultipliedWithin: aGroup [ 
	 
	| intersection | 
	^self allMultiplications 
		anySatisfy: 
			[:each |  
			intersection := each multiplyingEntities intersection: aGroup. 
			intersection size > 1 and: [intersection includes: self]]
]

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> numberOfExternalDuplications [ 
	<MSEProperty: #numberOfExternalDuplications type: #Number>
	<derived>
	<MSEComment: 'The number of pairs of duplicate fragments between this class and other classes'>

	^self 
		lookUpPropertyNamed: #numberOfExternalDuplications 
		computedAs: [self allExternalDuplications size]
]

{ #category : #'*SmallDude-Moose-accessing derived' }
FAMIXClass >> numberOfInternalDuplications [ 
	<MSEProperty: #numberOfInternalDuplications type: #Number>
	<derived>
	<MSEComment:  'The number of pairs of duplicate fragments within the class'>

	^self 
		lookUpPropertyNamed: #numberOfInternalDuplications 
		computedAs: [self allInternalDuplications size]
]
