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
	#category : #'Moose-Query-Traits'
}

{ #category : #meta }
TDependencyQueries classSide >> annotation [

	<FMClass: #TDependencyQueries super: #Object>
	<package: #'Moose-Query'>
	<generated>
	^self
]

{ #category : #helpers }
TDependencyQueries >> createIncomingQueryResultWith: aCollection [
	^ MooseIncomingQueryResult on: self withAll: aCollection
]

{ #category : #helpers }
TDependencyQueries >> createOutgoingQueryResultWith: aCollection [
	^ MooseOutgoingQueryResult on: self withAll: aCollection
]

{ #category : #testing }
TDependencyQueries >> entityHasIncomingTypeDeclarations [
	^ false
]

{ #category : #testing }
TDependencyQueries >> entityHasOutgoingTypeDeclarations [
	^ false
]

{ #category : #testing }
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

{ #category : #testing }
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

{ #category : #testing }
TDependencyQueries >> hasIncoming [
	"Checks for incoming associations of the receiver and its children.

	Example:
		aFAMIXClass hasIncoming.
			--> --> Will return true if the receiver or its children have incoming associations
	"
	
	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) hasFor: self
]

{ #category : #testing }
TDependencyQueries >> hasIncoming: aFAMIXClassAssociation [
	"Checks for incoming associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver or its children.
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) has: aFAMIXClassAssociation for: self
]

{ #category : #testing }
TDependencyQueries >> hasIncomingDependencies [
	"Associations + typeDeclaractions"

	^ self hasIncoming or: [ self hasIncomingTypeDeclarations ]
]

{ #category : #testing }
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

{ #category : #testing }
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

{ #category : #testing }
TDependencyQueries >> hasLocalIncoming [
	"Check the incoming or outgoing associations of the receiver.

	Example:
		aFAMIXClass hasLocalIncoming
			--> Will return true if aFAMIXMethod has the incoming FAMIXAssociation 
			"
 
	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) hasLocalFor: self
]

{ #category : #testing }
TDependencyQueries >> hasLocalIncoming: aFAMIXClassAssociation [
	"Checks for incoming associations of the FAMIXClassAssociation class for the receiver
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver.
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) hasLocal: aFAMIXClassAssociation for: self
]

{ #category : #testing }
TDependencyQueries >> hasLocalOutgoing [
	"Checks for outgoing associations of the receiver.
	
	Example:
		aFAMIXClass hasOutgoing
			--> Will return true if the receiver has outgoingInvocation.
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) hasLocalFor: self
]

{ #category : #testing }
TDependencyQueries >> hasLocalOutgoing: aFAMIXClassAssociation [
	"Checks for outgoing associations of the FAMIXClassAssociation class for the receiver.
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver.
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) hasLocal: aFAMIXClassAssociation for: self
]

{ #category : #testing }
TDependencyQueries >> hasOutgoing [
	"Checks for outgoing associations of the receiver and its children.

	Example:
		aFAMIXClass hasOutgoing.
			--> --> Will return true if the receiver or its children have outgoing associations
	"
	
	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) hasFor: self
]

{ #category : #testing }
TDependencyQueries >> hasOutgoing: aFAMIXClassAssociation [
	"Checks for outgoing associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass hasOutgoing: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has outgoing associations of the FAMIXClassAssociation class for the receiver or its children.
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) has: aFAMIXClassAssociation for: self
]

{ #category : #testing }
TDependencyQueries >> hasOutgoingDependencies [
	"Associations + typeDeclaractions"

	^ self hasOutgoing or: [ self hasOutgoingTypeDeclarations ]
]

{ #category : #testing }
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

{ #category : #'query dependencies' }
TDependencyQueries >> incomingTypeDeclarations [
	"Should return the incoming type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'query dependencies' }
TDependencyQueries >> outgoingTypeDeclarations [
	"Should return the outgoing type declarations of the entity as MooseQueryTypeDeclarationAssociation.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ {}
]

{ #category : #'query dependencies' }
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

{ #category : #'query dependencies' }
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

{ #category : #'query dependencies' }
TDependencyQueries >> queryAllIncoming [
	"Query all the incoming associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) queryAllFor: self
]

{ #category : #'query dependencies' }
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

{ #category : #'query dependencies' }
TDependencyQueries >> queryAllLocalIncoming [
	"Query all the incoming associations of the receiver.
	This method differ from #queryAllIncoming in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocalIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) queryAllLocalFor: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryAllLocalOutgoing [
	"Query all the outgoing associations of the receiver.
	This method differ from #queryAllOutgoing in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocalOutgoing.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXClass as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) queryAllLocalFor: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryAllOutgoing [
	"Query all the outgoing associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllOutgoing.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) queryAllFor: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryIncoming: aFAMIXClassAssociation [
	"Query all the incoming associations of the FAMIXClassAssociation class for the receiver and its children.

	Example:
		aFAMIXClass queryIncoming: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) query: aFAMIXClassAssociation for: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryIncomingDependencies [
	"Associations + typeDeclaractions"

	^ self queryAllIncoming
		addAll: self queryIncomingTypeDeclarations;
		yourself
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryIncomingTypeDeclarations [
	"This method should return the incoming type declarations that are not represented in FAMIX and that cannot be query by a generic algorithme.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ self createIncomingQueryResultWith: (self queryIncomingTypeDeclarationsIn: OrderedCollection new) asSet
]

{ #category : #'query dependencies' }
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

{ #category : #'query dependencies' }
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

{ #category : #'query dependencies' }
TDependencyQueries >> queryLocalIncoming: aFAMIXClassAssociation [
	"Query all the incoming associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #queryIncoming: in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryLocalIncoming: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) queryLocal: aFAMIXClassAssociation for: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryLocalOutgoing: aFAMIXClassAssociation [
	"Query all the outgoing associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #queryOutgoing: in the fact that it will not check the associations of the reicever's children.
	
	Example:
		aFAMIXClass queryLocalOutgoing: FAMIXInheritance.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) queryLocal: aFAMIXClassAssociation for: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryOutgoing: aFAMIXClassAssociation [
	"Query all the outgoing associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass queryOutgoing: FAMIXInheritance.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) query: aFAMIXClassAssociation for: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryOutgoingDependencies [
	"Associations + typeDeclarations"

	^ self queryAllOutgoing
		addAll: self queryOutgoingTypeDeclarations;
		yourself
]

{ #category : #'query dependencies' }
TDependencyQueries >> queryOutgoingTypeDeclarations [
	"This method should return the outgoing type declarations that are not represented in FAMIX and that cannot be query by a generic algorithme.
	
	typeDeclaration is a virtual association that relates a structural entity (i.e. a variable) to its type."

	^ self createOutgoingQueryResultWith: (self queryOutgoingTypeDeclarationsIn: OrderedCollection new) asSet
]

{ #category : #'query dependencies' }
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

{ #category : #'query dependencies' }
TDependencyQueries >> sourceThrough: aFAMIXClassAssociation [
	"Collect the source of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass sourceThrough: FAMIXReference.
			--> Will return a MooseIncomingQueryResult containing the methods having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) through: aFAMIXClassAssociation for: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> sourceThroughAll [
	"Collect the source of all the FAMIXClassAssociation classes for the receiver and its children.
	
	Example:
		aFAMIXClass sourceThroughAll.
			--> Will return a MooseIncomingQueryResult containing the methods having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) throughAllFor: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> targetThrough: aFAMIXClassAssociation [
	"Collect the target of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXMethod targetThrough: FAMIXReference.
			--> Will return a MooseOutgoingQueryResult containing the class having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) through: aFAMIXClassAssociation for: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> targetThroughAll [
	"Collect the target of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXMethod targetThroughAll.
			--> Will return a MooseOutgoingQueryResult containing the class having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) throughAllFor: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> throughAllFrom [
	"Query all the incoming associations of the receiver and its children.

	Example:
		aFAMIXClass throughAllFrom.
			--> Will return a MooseIncomingQueryResult containing all the FAMIXAssociations having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) throughAllFor: self
]

{ #category : #'query dependencies' }
TDependencyQueries >> throughAllTo [
	"Collect all the targets of the receiver and its children.
	
	Example:
		aFAMIXMethod throughAllTo.
			--> Will return a MooseOutgoingQueryResult containing the class having aFAMIXClass or its children as source
	"

	^ (MooseQueryCalculator strategy: MooseQueryOutgoingDirectionStrategy) throughAllFor: self
]
