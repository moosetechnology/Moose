Class {
	#name : #FamixTest3Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'classEntity',
		'primitiveType',
		'method',
		'type',
		'reference',
		'invocation'
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

	classEntity := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	type := builder newClassNamed: #Type.
	primitiveType := builder newClassNamed: #PrimitiveType.
	reference := builder newClassNamed: #Reference.
	invocation := builder newClassNamed: #Invocation.


]

{ #category : #definition }
FamixTest3Generator >> defineHierarchy [

	super defineHierarchy.

	type --|> namedEntity.
	type --|> #TType.

	classEntity --|> type.
	classEntity --|> #TClass.

	method --|> namedEntity.
	method --|> #TMethod.
	
	primitiveType --|> type.
	primitiveType --|> #TWithTypes.
	primitiveType --|> #TReferenceable.

	reference --|> association.
	reference --|> #TReference.
	
	invocation --|> association.
	invocation --|> #TInvocation
]
