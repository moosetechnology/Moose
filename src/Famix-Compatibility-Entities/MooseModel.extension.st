Extension { #name : #MooseModel }

{ #category : #'*Famix-Compatibility-Entities' }
MooseModel >> ensureClassesAndNamespaces [
	<menuItem: 'Ensure Classes and Namespaces' category: 'Utilities'>
	self allMethods
		do: [ :each | each parentType ifNil: [ each parentType: self unknownFAMIXClass ] ].
	self allClasses
		do: [ :each | each container ifNil: [ each container: self unknownFAMIXNamespace ] ]
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseModel >> inferNamespaceParentsBasedOnNames [
	<menuItem: 'Infer Namespace Parents Based on Names' category: 'Utilities'>
	| parent parentNameSize currentPosition parentName namespaces |
	namespaces := self allNamespaces.
	MooseCustomTask new with: [:task |
		namespaces do: [ :each | 
			currentPosition := 1.
			each name: (each name copyReplaceAll: '.' with: '::').
			[ currentPosition := each name indexOf: $: startingAt: currentPosition.
			currentPosition isZero not ] whileTrue: [
				parentName := (each name copyFrom: 1 to: currentPosition - 1) asSymbol.
				namespaces 
					detect: [ :x | parentName = x mooseName ]
					ifNone: [ 
						| newNamespace |
						newNamespace := FAMIXNamespace new name: parentName.
						namespaces add: newNamespace. 
						self add: newNamespace ].
				currentPosition := currentPosition + 2 ].
			task increment].
		namespaces do: [ :each | 
			each belongsTo ifNil: [
				parentNameSize := (each name lastIndexOf: $:) - 2.
				parentNameSize > 0 ifTrue: [
					parent := namespaces detect:	[ :x | 
						(each name copyFrom: 1 to: parentNameSize) asSymbol = x mooseName ]
						ifNone: [ nil ].
					parent ifNotNil: [
						each name: (each name copyFrom: parentNameSize + 3 to: each name size) asSymbol.
						each parentScope: parent ] ] ].
			task increment]
		] description: 'Infer namespace parents based on names' length: (namespaces size * 2);
	runWithProgress.
	^ self allNamespaces
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseModel class >> resetMeta [
	"self resetMeta"

	FAMIXEntity resetMSEProperties.
	FAMIXNamedEntity resetMSEProperties.
	
	metaTower := nil.
	
	FamixCompatibilityGenerator metamodel: nil.
	^self meta
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseModel >> unknownFAMIXClass [
	^ self allClasses 
		detect: [:each | each mooseName = #'unknownNamespace::UnknownClass'] 
		ifNone: [
			self add: (
				FAMIXClass new 
					name: 'UnknownClass'; 
					container: self unknownFAMIXNamespace; 
					isStub: true; 
					yourself)
		]
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseModel >> unknownFAMIXNamespace [
	^ self allNamespaces
		detect: [ :each | each mooseName = #unknownNamespace ]
		ifNone: [ self
				add:
					(FAMIXNamespace new
						name: 'unknownNamespace';
						isStub: true;
						yourself) ]
]
