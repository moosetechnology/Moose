"
Description
--------------------

This trait provides a common, paradigm agnostic vocabulary to query dependencies of software entities.

It includes some generic way to query an entity via its associations. The API offer the possibility to query an entity with three parameters:
- The direction of the navigation (Incoming/Outgoing -- in/out)
- The kind of association (FAMIXAcces, FAMIXReference, all...)
- The scope of the query (The receiver, the receiver and its children)

The actual core of the algorithms are in MooseQueryCalculator class.

Most  of the generic methods takes a symbol to describe the direction. This symbol will be used to find a MooseQueryAbstactDirectionStrategy to configure a MooseQueryCalculator.

For more informations: https://moosequery.ferlicot.fr/

Public API and Key Messages
--------------------

- #query: aSymbol with: aFAMIXAssociation 				Looks for the associations of the kind aFAMIXAssociation in the direction described by the symbol in the receiver and its children.
- #queryLocal: aSymbol with: aFAMIXAssociation 		Looks for the associations of the kind aFAMIXAssociation in the direction described by the symbol in the receiver.
- #queryAll: aSymbol 									Looks for the associations in the direction described by the symbol in the receiver and its children.

There is a lot of other generic queries. You can find all of them in the ""moose-queries-generic"" protocol.

Examples
--------------------

	aFAMIXClass query: #in with: FAMIXInheritance.
		--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
			
	aFAMIXMethod query: #out with: FAMIXAccess.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod or its children as source
	
	
	aFAMIXClass queryLocal: #in with: FAMIXInheritance.
		--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as target
	
	aFAMIXMethod queryLocal: #out with: FAMIXAccess.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod as source		
	
			
	aFAMIXClass queryAll: #in.
		--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
	
	aFAMIXMethod queryAll: #out.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod or its children as source
	
		
	aFAMIXClass queryAllLocal: #in.
		--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass as target
	
	aFAMIXMethod queryAllLocal: #out.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod as source


"
Trait {
	#name : #TDependencyQueries,
	#category : #'Moose-Query'
}

{ #category : #meta }
TDependencyQueries classSide >> annotation [

	<MSEClass: #TDependencyQueries super: #Trait>
	<generated>
	<package: #'Moose-Query'>
	^self
]

{ #category : #generator }
TDependencyQueries classSide >> generatedSlotNames [
	<generated>
	'TDependencyQueries class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
TDependencyQueries classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> createFromTo: anInOutSymbol [
	self
		deprecated:
			'CyrilFerlicot 25/04/2017: I think this method is not used anymore. If I am wrong the senders should be changed to use a MooseQueryAbstractDirectionStrategy. You''ll have to implement a new method on it and it will use dispatch instead of condition.'.
	^ anInOutSymbol = #in
		ifTrue: [ #from ]
		ifFalse: [ anInOutSymbol = #out
				ifTrue: [ #to ] ]
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> createIncomingQueryResultWith: aCollection [
	^ MooseIncomingQueryResult on: self withAll: aCollection
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> createOutgoingQueryResultWith: aCollection [
	^ MooseOutgoingQueryResult on: self withAll: aCollection
]

{ #category : #'moosequery-queries-incoming' }
TDependencyQueries >> entityHasIncomingTypeDeclarations [
	^ false
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> entityHasOutgoingTypeDeclarations [
	^ false
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> has: anInOutSymbol [
	"Check the incoming or outgoing associations of the receiver or its children.

	Example:
		aFAMIXClass has: #in.
			--> Will return trye if aFAMIXMethod has the incoming FAMIXAssociation 
		aFAMIXMethod has: #out.
			--> Will return true if aFAMIXMethod has the outgoing FAMIXAssociation
	"

	^ (MooseQueryCalculator direction: anInOutSymbol) hasFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> has: anInOutSymbol with: aFAMIXClassAssociation [
	"Query all the incoming or outgoing associations of the FAMIXClassAssociation class for the receiver and its children.

	Example:
		aFAMIXClass query: #in with: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
		aFAMIXMethod query: #out with: FAMIXAccess.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod or its children as source
	"

	^ (MooseQueryCalculator direction: anInOutSymbol) has: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasIncoming [
	"Checks for incoming associations of the receiver and its children.

	Example:
		aFAMIXClass hasIncoming.
			--> --> Will return true if the receiver or its children have incoming associations
	"
	
	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) hasFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasIncoming: aFAMIXClassAssociation [
	"Checks for incoming associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver or its children.
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) has: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasIncomingDependencies [
	"Associations + typeDeclaractions"

	^ self hasIncoming or: [ self hasIncomingTypeDeclarations ]
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasIncomingTypeDeclarations [
	"This method could be more readable but it needs to be really performant"

	| selectors |
	1 to: (selectors := self childrenSelectors) size do: [ :index | 
		(self perform: (selectors at: index))
			ifNotNil: [ :children | 
				| coll |
				1 to: (coll := children asCollection) size do: [ :i | ((coll at: i) hasIncomingTypeDeclarations) ifTrue: [ ^ true ]  ] ] ].
	 ^ self entityHasIncomingTypeDeclarations.
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasLocal: anInOutSymbol [
	"Check the incoming or outgoing associations of the receiver.

	Example:
		aFAMIXClass hasLocal: #in.
			--> Will return trye if aFAMIXMethod has the incoming FAMIXAssociation 
		aFAMIXMethod hasLocal: #out.
			--> Will return true if aFAMIXMethod has the outgoing FAMIXAssociation
	"
 
	^ (MooseQueryCalculator direction: anInOutSymbol) hasLocalFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasLocalIncoming [
	"Check the incoming or outgoing associations of the receiver.

	Example:
		aFAMIXClass hasLocalIncoming
			--> Will return true if aFAMIXMethod has the incoming FAMIXAssociation 
			"
 
	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) hasLocalFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasLocalIncoming: aFAMIXClassAssociation [
	"Checks for incoming associations of the FAMIXClassAssociation class for the receiver
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver.
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) hasLocal: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasLocalOutgoing [
	"Checks for outgoing associations of the receiver.
	
	Example:
		aFAMIXClass hasOutgoing
			--> Will return true if the receiver has outgoingInvocation.
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) hasLocalFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasLocalOutgoing: aFAMIXClassAssociation [
	"Checks for outgoing associations of the FAMIXClassAssociation class for the receiver.
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver.
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) hasLocal: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasOutgoing [
	"Checks for outgoing associations of the receiver and its children.

	Example:
		aFAMIXClass hasOutgoing.
			--> --> Will return true if the receiver or its children have outgoing associations
	"
	
	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) hasFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasOutgoing: aFAMIXClassAssociation [
	"Checks for outgoing associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass hasOutgoing: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has outgoing associations of the FAMIXClassAssociation class for the receiver or its children.
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) has: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasOutgoingDependencies [
	"Associations + typeDeclaractions"

	^ self hasOutgoing or: [ self hasOutgoingTypeDeclarations ]
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> hasOutgoingTypeDeclarations [
	"This method could be more readable but it needs to be really performant"

	| selectors |
	1 to: (selectors := self childrenSelectors) size do: [ :index | 
		(self perform: (selectors at: index))
			ifNotNil: [ :children | 
				| coll |
				1 to: (coll := children asCollection) size do: [ :i | ((coll at: i) hasOutgoingTypeDeclarations) ifTrue: [ ^ true ]  ] ] ].
	 ^ self entityHasOutgoingTypeDeclarations.
]

{ #category : #'moosequery-queries-incoming' }
TDependencyQueries >> incomingTypeDeclarations [
	"Should return the incoming type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'moosequery-queries-outgoing' }
TDependencyQueries >> outgoingTypeDeclarations [
	"Should return the outgoing type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> query: anInOutSymbol with: aFAMIXClassAssociation [
	"Query all the incoming or outgoing associations of the FAMIXClassAssociation class for the receiver and its children.

	Example:
		aFAMIXClass query: #in with: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
		aFAMIXMethod query: #out with: FAMIXAccess.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod or its children as source
	"

	^ (MooseQueryCalculator direction: anInOutSymbol) query: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryAll: anInOutSymbol [
	"Query all the incoming or outgoing associations of the receiver or its children.

	Example:
		aFAMIXClass queryAll: #in.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
		aFAMIXMethod queryAll: #out.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod or its children as source
	"

	^ (MooseQueryCalculator direction: anInOutSymbol) queryAllFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryAllIncoming [
	"Query all the incoming associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) queryAllFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryAllLocal: anInOutSymbol [
	"Query all the incoming or outgoing associations of the receiver.
	This method differ from #queryAll: in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocal: #in.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass as target
		aFAMIXMethod queryAllLocal: #out.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod as source
	"

	^ (MooseQueryCalculator direction: anInOutSymbol) queryAllLocalFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryAllLocalIncoming [
	"Query all the incoming associations of the receiver.
	This method differ from #queryAllIncoming in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocalIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) queryAllLocalFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryAllLocalOutgoing [
	"Query all the outgoing associations of the receiver.
	This method differ from #queryAllOutgoing in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocalOutgoing.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXClass as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) queryAllLocalFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryAllOutgoing [
	"Query all the outgoing associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllOutgoing.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) queryAllFor: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryIncoming: aFAMIXClassAssociation [
	"Query all the incoming associations of the FAMIXClassAssociation class for the receiver and its children.

	Example:
		aFAMIXClass queryIncoming: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) query: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-incoming' }
TDependencyQueries >> queryIncomingDependencies [
	"Associations + typeDeclaractions"

	^ self queryAllIncoming
		addAll: self queryIncomingTypeDeclarations;
		yourself
]

{ #category : #'moosequery-queries-incoming' }
TDependencyQueries >> queryIncomingTypeDeclarations [
	"This method should return the incoming type declarations that are not represented in FAMIX and that cannot be query by a generic algorithme.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ self createIncomingQueryResultWith: (self queryIncomingTypeDeclarationsIn: OrderedCollection new) asSet
]

{ #category : #'moosequery-queries-incoming' }
TDependencyQueries >> queryIncomingTypeDeclarationsIn: aCollection [
	"This method could be more readable but it needs to be really performant"

	| selectors |
	1 to: (selectors := self childrenSelectors) size do: [ :index | 
		(self perform: (selectors at: index))
			ifNotNil: [ :children | 
				| coll |
				1 to: (coll := children asCollection) size do: [ :i | (coll at: i) queryIncomingTypeDeclarationsIn: aCollection ] ] ].
	aCollection addAll: self incomingTypeDeclarations.
	^ aCollection
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryLocal: anInOutSymbol with: aFAMIXClassAssociation [
	"Query all the incoming or outgoing associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #query:with: in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryLocal: #in with: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as target
		aFAMIXMethod queryLocal: #out with: FAMIXAccess.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod as source
	"

	^ (MooseQueryCalculator direction: anInOutSymbol) queryLocal: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryLocalIncoming: aFAMIXClassAssociation [
	"Query all the incoming associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #queryIncoming: in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryLocalIncoming: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) queryLocal: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryLocalOutgoing: aFAMIXClassAssociation [
	"Query all the outgoing associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #queryOutgoing: in the fact that it will not check the associations of the reicever's children.
	
	Example:
		aFAMIXClass queryLocalOutgoing: FAMIXInheritance.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) queryLocal: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-generic' }
TDependencyQueries >> queryOutgoing: aFAMIXClassAssociation [
	"Query all the outgoing associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass queryOutgoing: FAMIXInheritance.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) query: aFAMIXClassAssociation for: self
]

{ #category : #'moosequery-queries-outgoing' }
TDependencyQueries >> queryOutgoingDependencies [
	"Associations + typeDeclarations"

	^ self queryAllOutgoing
		addAll: self queryOutgoingTypeDeclarations;
		yourself
]

{ #category : #'moosequery-queries-outgoing' }
TDependencyQueries >> queryOutgoingTypeDeclarations [
	"This method should return the outgoing type declarations that are not represented in FAMIX and that cannot be query by a generic algorithme.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ self createOutgoingQueryResultWith: (self queryOutgoingTypeDeclarationsIn: OrderedCollection new) asSet
]

{ #category : #'moosequery-queries-outgoing' }
TDependencyQueries >> queryOutgoingTypeDeclarationsIn: aCollection [
	"This method could be more readable but it needs to be really performant"

	| selectors |
	1 to: (selectors := self childrenSelectors) size do: [ :index | 
		(self perform: (selectors at: index))
			ifNotNil: [ :children | 
				| coll |
				1 to: (coll := children asCollection) size do: [ :i | (coll at: i) queryOutgoingTypeDeclarationsIn: aCollection ] ] ].
	aCollection addAll: self outgoingTypeDeclarations.
	^ aCollection
]
