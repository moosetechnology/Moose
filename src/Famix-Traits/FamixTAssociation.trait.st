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
Trait {
	#name : #FamixTAssociation,
	#instVars : [
		'#next => FMOne type: #FamixTAssociation opposite: #previous',
		'#previous => FMOne type: #FamixTAssociation opposite: #next'
	],
	#traits : 'FamixTSourceEntity + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Association'
}

{ #category : #meta }
FamixTAssociation classSide >> annotation [

	<FMClass: #TAssociation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTAssociation classSide >> source: anEntity target: anotherEntity [
	^ self new
		source: anEntity;
		target: anotherEntity;
		yourself
]

{ #category : #'instance creation' }
FamixTAssociation classSide >> source: anEntity target: anotherEntity model: aMooseModel [
	^ (self source: anEntity target: anotherEntity)
		mooseModel: aMooseModel;
		yourself
]

{ #category : #accessing }
FamixTAssociation >> from [
	^ self source
]

{ #category : #accessing }
FamixTAssociation >> from: aFrom [
	self source: aFrom
]

{ #category : #testing }
FamixTAssociation >> isAssociation [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAssociation >> next [
	"Relation named: #next type: #FamixTAssociation opposite: #previous"

	<generated>
	<FMComment: 'Next association in an ordered collection of associations. Currently not supported by the Moose importer'>
	<derived>
	^ next
]

{ #category : #accessing }
FamixTAssociation >> next: anObject [

	<generated>
	next := anObject
]

{ #category : #accessing }
FamixTAssociation >> previous [
	"Relation named: #previous type: #FamixTAssociation opposite: #next"

	<generated>
	<FMComment: 'Previous association in an ordered collection of associations. Currently not supported by the Moose importer'>
	^ previous
]

{ #category : #accessing }
FamixTAssociation >> previous: anObject [

	<generated>
	previous := anObject
]

{ #category : #accessing }
FamixTAssociation >> source [
	^ self explicitRequirement
]

{ #category : #accessing }
FamixTAssociation >> source: aSource [
	self explicitRequirement
]

{ #category : #accessing }
FamixTAssociation >> target [
	^ self explicitRequirement
]

{ #category : #accessing }
FamixTAssociation >> target: aTarget [
	self explicitRequirement
]

{ #category : #accessing }
FamixTAssociation >> to [
	^ self target
]

{ #category : #accessing }
FamixTAssociation >> to: aTo [
	self target: aTo
]
