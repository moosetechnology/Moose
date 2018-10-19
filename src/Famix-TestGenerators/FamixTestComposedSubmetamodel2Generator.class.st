Class {
	#name : #FamixTestComposedSubmetamodel2Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'classEntity',
		'method'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTestComposedSubmetamodel2Generator class >> packageName [ 

	^ 'Famix-TestComposedSubmetamodel2-Entities'


]

{ #category : #accessing }
FamixTestComposedSubmetamodel2Generator class >> prefix [

	^ #FamixTestComposed2
]

{ #category : #definition }
FamixTestComposedSubmetamodel2Generator >> defineClasses [

	super defineClasses.

	classEntity := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
]

{ #category : #definition }
FamixTestComposedSubmetamodel2Generator >> defineHierarchy [ 

	super defineHierarchy.

	classEntity --|> namedEntity.
	classEntity --|> #TClass.
	classEntity --|> #TWithMethods.

	method --|> namedEntity.
	method --|> #TMethod.

]
