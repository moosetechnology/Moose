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
MooseModel class >> resetMeta [
	"self resetMeta"

	FAMIXEntity resetMSEProperties.
	FAMIXNamedEntity resetMSEProperties.
	
	metaTower := nil.
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
