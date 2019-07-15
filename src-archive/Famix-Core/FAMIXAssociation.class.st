"
FAMIXAssociation is an abstract superclass for relationships between Famix named entities. It defines a polymorphic API refined by subclasses: essentially from, to, next and previous.

From and To properties are abstract at this level, but specific implementations can have multiple ends and properties. 
For example, FAMIXInheritance has:
	(i) From mapped to the subclass;
	(ii) To mapped to the superclass.
	
To adapt your code to MooseQuery, you have also to add the <source> and <target> pragmas in the selectors definition for each class inheriting FAMIXAssociation

Next and Previous properties provide an order of the appearence of these associations in code. The order is calculated within a particular relationship for example, method invocation order within a calling method (from).
For example in java, the following code
 method a() { b(); c(); }
will produce two invocation associations first from method a to method b, and second from method a to method c. These associations are bound together and can be navigated with previous and next.




"
Class {
	#name : #FAMIXAssociation,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'TAssociationMetaLevelDependency',
	#classTraits : 'TAssociationMetaLevelDependency classTrait',
	#instVars : [
		'previous',
		'next'
	],
	#classInstVars : [
		'targetTypes',
		'sourceTypes'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXAssociation class >> annotation [
	<MSEClass: #Association super: #FAMIXSourcedEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXAssociation class >> possibleSourceClasses [
	self 
		deprecated: 'Use sourceTypes instead'
		on: '23 January 2018' 
		in: 'Moose6.1'
		transformWith: '`@receiver possibleSourceClasses' -> '`@receiver sourceTypes'.
	^ self sourceTypes
]

{ #category : #accessing }
FAMIXAssociation class >> possibleTargetClasses [
	self 
		deprecated: 'Use targetTypes instead'
		on: '23 January 2018' 
		in: 'Moose6.1'
		transformWith: '`@receiver possibleTargetClasses' -> '`@receiver targetTypes'.
	^ self targetTypes
]

{ #category : #accessing }
FAMIXAssociation class >> sourceTypes [
	^ sourceTypes
		ifNil: [ sourceTypes := self privateSourceTypes ]
]

{ #category : #accessing }
FAMIXAssociation class >> targetTypes [
	^ targetTypes
		ifNil: [ targetTypes := self privateTargetTypes ]
]

{ #category : #accessing }
FAMIXAssociation >> anyTo [
	"This is a utility method that could be used polymorphically to obtain exactly one
	target entity even when the internal implementation stores these as a collection"
	^ self to asOrderedCollection anyOne
]

{ #category : #accessing }
FAMIXAssociation >> from [
	"Polymorphic accessor to the entity originating the association.
	It should be refined by subclasses by delegating to a concrete property.
	This property should always remain derived."
	
	<MSEProperty: #from type: #FAMIXNamedEntity> <derived>
	<MSEComment: 'Generic accessor to the entity originating the association. Refined by subclasses'>
	^ self subclassResponsibility
]

{ #category : #printing }
FAMIXAssociation >> gtDisplayOn: aStream [
	self from gtDisplayOn: aStream.
	aStream nextPutAll: ' -> '.
	self to gtDisplayOn: aStream	
]

{ #category : #accessing }
FAMIXAssociation >> next [
	<MSEProperty: #next type: #FAMIXAssociation opposite: #previous> <derived>
	<MSEComment: 'Next association in an ordered collection of associations. Currently not supported by the Moose importer'>
	
	^ next
]

{ #category : #accessing }
FAMIXAssociation >> next: anAssociation [
	next := anAssociation
]

{ #category : #accessing }
FAMIXAssociation >> previous [
	<MSEProperty: #previous type: #FAMIXAssociation opposite: #next>
	<MSEComment: 'Previous association in an ordered collection of associations. Currently not supported by the Moose importer'>
	
	^ previous
]

{ #category : #accessing }
FAMIXAssociation >> previous: anAssociation [
	| old |
	previous = anAssociation
		ifTrue: [ ^ self ].
	old := previous.
	previous := anAssociation.
	old ifNotNil: [ old next: nil ].
	anAssociation ifNotNil: [ anAssociation next: self ]
]

{ #category : #accessing }
FAMIXAssociation >> to [
	"Polymorphic accessor to the target entity of the association.
	It should be refined by subclasses by delegating to a concrete property.
	This property should always remain derived."

	<MSEProperty: #to type: #FAMIXNamedEntity> <derived>
	<MSEComment: 'Generic accessor to the target entity of the association'>
	^ self subclassResponsibility
]
