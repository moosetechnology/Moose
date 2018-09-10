"
FAMIXScopingEntity represents an entity defining a scope at a global level. 

Packages and Namespaces are two different concept in terms of scoping entity. Namespaces have semantic meaning in the language so they influence the unique name of the entity, while Packages are physical entities for packaging. In Smalltalk the two are explicitly different. In C++ we have explicit Namespaces, but not so explicit Packages. In Java, we have both Namespace (what you define in your Java source), and Package (the folder structure), but they happen to overlap in naming (although one is with . and the other one is with /) so people tend to see them as packages only.
"
Class {
	#name : #FAMIXScopingEntity,
	#superclass : #FAMIXContainerEntity,
	#instVars : [
		'globalVariables',
		'parentScope',
		'childScopes'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXScopingEntity class >> annotation [
	<MSEClass: #ScopingEntity super: #FAMIXContainerEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXScopingEntity >> addChildScope: aScopingEntity [ 
	childScopes add: aScopingEntity
]

{ #category : #accessing }
FAMIXScopingEntity >> addGlobalVariable: aGlobalVariable [ 
	globalVariables add: aGlobalVariable
]

{ #category : #accessing }
FAMIXScopingEntity >> belongsTo [
	^ self parentScope ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FAMIXScopingEntity >> childScopes [
	<MSEProperty: #childScopes type: #FAMIXScopingEntity opposite: #parentScope>	 <multivalued> <derived>
	<MSEComment: 'Child scopes embedded in this scope, if any.'>

	^ childScopes
]

{ #category : #accessing }
FAMIXScopingEntity >> childScopes: aCollectionOfScopingEntity [ 
	childScopes value: aCollectionOfScopingEntity
]

{ #category : #accessing }
FAMIXScopingEntity >> globalVariables [
	<MSEProperty: #globalVariables type: #FAMIXGlobalVariable opposite: #parentScope> <multivalued> <derived>
	<MSEComment: 'Global variables defined in the scope, if any.'>
	
	^globalVariables
]

{ #category : #accessing }
FAMIXScopingEntity >> globalVariables: aGlobalVariable [
	globalVariables value: aGlobalVariable
]

{ #category : #'initialize-release' }
FAMIXScopingEntity >> initialize [
	super initialize.
	childScopes := FMNullMultivalueLink on: self opposite: #parentScope: selector: #childScopes.
	globalVariables := FMNullMultivalueLink on: self opposite: #parentScope: selector: #globalVariables.
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXScopingEntity >> methodScope [
	"This only makes sense to reject self loops in #collectAtScope:"

	^ self classes collectAsSet: [:c | c methods]
]

{ #category : #accessing }
FAMIXScopingEntity >> parentScope [
	<MSEProperty: #parentScope type: #FAMIXScopingEntity opposite: #childScopes>
	<MSEComment: 'Parent scope embedding this scope, if any.'>
	<container>
	^ parentScope
]

{ #category : #accessing }
FAMIXScopingEntity >> parentScope: aScopingEntity [ 
	parentScope := FMMultivalueLink 
		on: self
		update: #childScopes
		from: self parentScope
		to: aScopingEntity.
	self resetMooseName
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXScopingEntity >> typeScope [
	"This only makes sense to reject self loops in #collectAtScope:"
	^ self classes
]
