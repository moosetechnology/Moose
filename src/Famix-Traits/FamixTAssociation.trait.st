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
	#category : #'Famix-Traits-Association'
}

{ #category : #meta }
FamixTAssociation classSide >> annotation [

	<MSEClass: #TAssociation super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
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
	<MSEComment: 'Next association in an ordered collection of associations. Currently not supported by the Moose importer'>
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
	<MSEComment: 'Previous association in an ordered collection of associations. Currently not supported by the Moose importer'>
	^ previous
]

{ #category : #accessing }
FamixTAssociation >> previous: anObject [

	<generated>
	previous := anObject

]
