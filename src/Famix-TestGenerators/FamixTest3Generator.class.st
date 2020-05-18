Class {
	#name : #FamixTest3Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'classEntity',
		'primitiveType',
		'method',
		'type',
		'reference',
		'invocation',
		'classEntitygroup',
		'typeGroup',
		'attribute',
		'access',
		'package'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest3Generator class >> packageName [

	^ #'Famix-Test3-Entities'
]

{ #category : #accessing }
FamixTest3Generator class >> prefix [

	^ #'FamixTest3'
]

{ #category : #definition }
FamixTest3Generator >> defineClasses [

	super defineClasses.

	access := builder newClassNamed: #Access.
	attribute := builder newClassNamed: #Attribute.
	classEntity := builder newClassNamed: #Class.
	classEntitygroup := classEntity withGroup.
	method := builder newClassNamed: #Method.
	package := builder newClassNamed: #Package.
	type := builder newClassNamed: #Type.
	typeGroup := type withGroup.
	primitiveType := builder newClassNamed: #PrimitiveType.
	reference := builder newClassNamed: #Reference.
	invocation := builder newClassNamed: #Invocation.


]

{ #category : #definition }
FamixTest3Generator >> defineHierarchy [

	super defineHierarchy.

	access --|> #TAccess.

	attribute --|> #TAttribute.
	
	type --|> namedEntity.
	type --|> #TType.

	classEntity --|> type.
	classEntity --|> #TClass.

	method --|> namedEntity.
	method --|> #TMethod.
	
	package --|> #TPackage.
	
	primitiveType --|> type.
	primitiveType --|> #TWithTypes.
	primitiveType --|> #TReferenceable.

	reference --|> #TReference.
	
	invocation --|> #TInvocation.
	
	"groups"
	classEntitygroup --|> typeGroup.
]
