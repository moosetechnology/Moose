"
FAMIXScopingEntity represents an entity defining a scope at a global level. 

Packages and Namespaces are two different concept in terms of scoping entity. Namespaces have semantic meaning in the language so they influence the unique name of the entity, while Packages are physical entities for packaging. In Smalltalk the two are explicitly different. In C++ we have explicit Namespaces, but not so explicit Packages. In Java, we have both Namespace (what you define in your Java source), and Package (the folder structure), but they happen to overlap in naming (although one is with . and the other one is with /) so people tend to see them as packages only.
"
Trait {
	#name : #FamixTScopingEntity,
	#instVars : [
		'#childScopes => FMMany type: #FamixTScopingEntity opposite: #parentScope',
		'#parentScope => FMOne type: #FamixTScopingEntity opposite: #childScopes'
	],
	#category : #'Famix-Traits-ScopingEntity'
}

{ #category : #meta }
FamixTScopingEntity classSide >> annotation [

	<FMClass: #TScopingEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTScopingEntity >> addChildScope: aScopingEntity [ 
	childScopes add: aScopingEntity
]

{ #category : #accessing }
FamixTScopingEntity >> allChildScopes [
	| result |
	result := OrderedCollection new.
	self allChildScopesDo: [ :each | result add: each].
	^ result 
]

{ #category : #accessing }
FamixTScopingEntity >> allChildScopesDo: aBlock [
	self childScopes do: [:each |
		each withAllChildScopesDo: aBlock ]
]

{ #category : #accessing }
FamixTScopingEntity >> allChildScopesGroup [
	<navigation: 'All child scopes'>
	^ FAMIXNamespaceGroup withAll: self allChildScopes withDescription: 'All child scopes from ', self printString
]

{ #category : #accessing }
FamixTScopingEntity >> allParentScopesDo: aBlock [
	self parentScope notNil ifTrue: [
		self parentScope withAllParentScopesDo: aBlock ]
]

{ #category : #accessing }
FamixTScopingEntity >> childScopes [
	"Relation named: #childScopes type: #FamixTScopingEntity opposite: #parentScope"

	<generated>
	<FMComment: 'Child scopes embedded in this scope, if any.'>
	<derived>
	^ childScopes
]

{ #category : #accessing }
FamixTScopingEntity >> childScopes: anObject [

	<generated>
	childScopes value: anObject
]

{ #category : #accessing }
FamixTScopingEntity >> isRoot [
	^ self parentScope isNil
]

{ #category : #accessing }
FamixTScopingEntity >> parentScope [
	"Relation named: #parentScope type: #FamixTScopingEntity opposite: #childScopes"

	<generated>
	<FMComment: 'Parent scope embedding this scope, if any.'>
	<container>
	^ parentScope
]

{ #category : #accessing }
FamixTScopingEntity >> parentScope: anObject [

	parentScope := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTScopingEntity >> parentScopeGroup [
	<generated>
	<navigation: 'ParentScope'>
	^ MooseGroup with: self parentScope
]

{ #category : #accessing }
FamixTScopingEntity >> root [
	^ self isRoot 
		ifTrue: [ self ]
		ifFalse: [ ^ self parentScope root ]
]

{ #category : #accessing }
FamixTScopingEntity >> withAllChildScopes [
	| result |
	result := OrderedCollection new.
	self withAllChildScopesDo: [ :each | result add: each].
	^ result 
]

{ #category : #accessing }
FamixTScopingEntity >> withAllChildScopesDo: aBlock [
	aBlock value: self.
	self allChildScopesDo: aBlock
]

{ #category : #accessing }
FamixTScopingEntity >> withAllParentScopes [
	| result |
	result := OrderedCollection new.
	self withAllParentScopesDo: [ :each | result add: each].
	^ result 
]

{ #category : #accessing }
FamixTScopingEntity >> withAllParentScopesDo: aBlock [
	aBlock value: self.
	self allParentScopesDo: aBlock
]
