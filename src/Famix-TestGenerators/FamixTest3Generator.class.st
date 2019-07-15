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
	type := builder newClassNamed: #Types.
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
	classEntity --|> #TWithMethods.

	method --|> namedEntity.
	method --|> #TMethod.
	method --|> #TWithTypes.
	
	primitiveType --|> type.
	primitiveType --|> #TWithTypes.

	reference --|> association.
	reference --|> #TReference.
	
	method --|> #TWithReferences.
	primitiveType --|> #TReferenceable.
	
	invocation --|> association.
	invocation --|> #TInvocation.

	method --|> #TInvocable.
	method --|> #TWithInvocations.
	


]

{ #category : #definition }
FamixTest3Generator >> newBuilder [

	^ self builderWithStandardTraits
		withImportingContext;
		yourself
		
		
	
]
