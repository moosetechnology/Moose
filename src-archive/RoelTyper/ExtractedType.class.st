Class {
	#name : #ExtractedType,
	#superclass : #AbstractType,
	#instVars : [
		'interface',
		'assignments',
		'extractedTypes',
		'links'
	],
	#category : #'RoelTyper-Core'
}

{ #category : #'instance creation' }
ExtractedType class >> forInstvar: iv inClass: aClass interface: selectorCollection assignments: classCollection [
	^(self
		forInstvar: iv
		inClass: aClass)
		interface: selectorCollection
		assignments: classCollection
]

{ #category : #private }
ExtractedType class >> mergerClass [
	"Still experimenting with different mergers. So for the moment I uncomment things to experiment with."

		"^ConcreteMerger"
		"^AbstractMerger"

	^AssignmentsFirstMerger
]

{ #category : #'private-accessing' }
ExtractedType >> addAssignment: anObject [
	(self assignments includes: anObject)
		ifFalse: [self assignments add: anObject]
]

{ #category : #'private-accessing' }
ExtractedType >> addLinkedExtractedType: anExtractedType [
	 links add: anExtractedType liveExtractType
]

{ #category : #'private-accessing' }
ExtractedType >> addReverseLinkedExtractedType: anExtractedType [
	links add: anExtractedType liveExtractType.
	anExtractedType liveExtractType  addLinkedExtractedType: self
]

{ #category : #'private-accessing' }
ExtractedType >> addSend: anObject [
	self interface add: anObject
]

{ #category : #'private-accessing' }
ExtractedType >> assignments [
	^assignments
]

{ #category : #'private-accessing' }
ExtractedType >> basicExtractedTypes [
	^extractedTypes
]

{ #category : #private }
ExtractedType >> cleanedAssignments [
	| assigns |
	assigns := self assignments copy.
	((assigns includes: True) or: [assigns includes: False])
		ifTrue:
			[assigns
				remove: True ifAbsent: [];
				remove: False ifAbsent: [];
				add: Boolean].
	^assigns
]

{ #category : #accessing }
ExtractedType >> contents [
	^self types
]

{ #category : #private }
ExtractedType >> flattenLinks [
	[links isEmpty] 
		whileFalse: [|link|
			link :=  links anyOne.
			links remove: link.
			link flattenLinks.
			link interface
				do: [ :sel | self addSend: sel ].
			link assignments
				do: [ :assign | self addAssignment: assign ]].
	
]

{ #category : #private }
ExtractedType >> foldInterfaceTypes: interfaceClasses withAssignmentTypes: assignmentClasses [

	| tmp | 
	assignmentClasses remove: UndefinedObject ifAbsent: [].
	tmp:=interfaceClasses.
	(assignmentClasses size=0 and: [
		((interface includes: #value) 
		or: [interface includes: #value:]) and: [interfaceClasses includes: BlockClosure]]) 
			ifTrue: [ tmp:=OrderedCollection with: BlockClosure]
			ifFalse: [ tmp:=interfaceClasses].
	^self class mergerClass
		interfaceTypes: tmp
		assignmentTypes: assignmentClasses
]

{ #category : #testing }
ExtractedType >> hasEmptyAssignments [
	^self assignments isEmpty
]

{ #category : #testing }
ExtractedType >> hasEmptyInterface [
	^self interface isEmpty
]

{ #category : #initialization }
ExtractedType >> initialize [
	super initialize.
	links := Set new.
	self
		interface: IdentitySet new
		assignments: OrderedCollection new.
]

{ #category : #'private-accessing' }
ExtractedType >> interface [
	^interface
]

{ #category : #'private-accessing' }
ExtractedType >> interface: selectorCollection assignments: classCollection [
	interface := selectorCollection.
	assignments := classCollection
]

{ #category : #testing }
ExtractedType >> isEmpty [
	^self hasEmptyAssignments and: [self hasEmptyInterface]
]

{ #category : #testing }
ExtractedType >> isExtractedResult [
	^true
]

{ #category : #'private-accessing' }
ExtractedType >> links [
	^links
]

{ #category : #private }
ExtractedType >> mergeTypes [
	self flattenLinks.
	^self
		foldInterfaceTypes: (self rootsUnderstanding: self interface)
		withAssignmentTypes: self cleanedAssignments
]

{ #category : #printing }
ExtractedType >> printInterfaceAndAssigments [
	| s |
	s := WriteStream on: String new.
	self printInterfaceAndAssigmentsOn: s.
	^ s contents
]

{ #category : #printing }
ExtractedType >> printInterfaceAndAssigmentsOn: aStream [
	aStream nextPutAll: 'Sends: {'.
	self interface
		do: [ :symbol | aStream print: symbol ]
		separatedBy: [ aStream space ].
	aStream
		nextPutAll: '}';
		cr;
		nextPutAll: 'Assignments: {'.
	self assignments
		do: [ :symbol | aStream print: symbol ]
		separatedBy: [ aStream space ].
	aStream
		nextPutAll: '}';
		cr
]

{ #category : #printing }
ExtractedType >> printOn: aStream [
	aStream nextPutAll: 'ExtractedType: '.
	self basicExtractedTypes
		ifNil: [self printInterfaceAndAssigmentsOn: aStream]
		ifNotNil: [self printTypesOn: aStream]
]

{ #category : #private }
ExtractedType >> rootsUnderstanding: selectors [
	"When the set of selectors is not empty, answer a set of the highest possible classes in the system that implement all the selectors. When the set of selectors is empty, return the empty set."

	| initialClasses nextClasses traverseStack next |
	selectors isEmpty ifTrue: [^OrderedCollection new].
	nextClasses := OrderedCollection with: Object.
	traverseStack := OrderedCollection new: 10000.
		
	selectors
		do:
			[:selector | 
			initialClasses := nextClasses.
			nextClasses := OrderedCollection new.
			initialClasses
				do:
					[:initialClass | 
					"inline canUnderstand: for performance"
					|cl|
					cl := initialClass.
					[(cl == nil) or: [(cl methodDict pointsTo: selector)]] whileFalse: [cl := cl superclass].
					(cl == nil)
						ifFalse: [nextClasses addLast: initialClass]
						ifTrue:
							[|size|
							traverseStack reset.
							traverseStack addLast: initialClass.
							size := 1.
							"(traverseStack isEmpty) removed for performance"
							[size = 0]
								whileFalse:
									[
									"(traverseStack removeFirst) removed for performance"
									next := traverseStack unsafeRemoveFirst.
									size := size -1.
									next
										subclassesDo:
											[:subcl |
											"(subcl includesSelector: selector) removed for performance"
											(subcl methodDict pointsTo: selector)
												ifTrue: [nextClasses addLast: subcl]
												ifFalse: [traverseStack addLast: subcl. size := size + 1]]]]]].
	^nextClasses
]

{ #category : #accessing }
ExtractedType >> types [
	^extractedTypes
		ifNil: [extractedTypes := self mergeTypes]
		ifNotNil: [extractedTypes]
]
