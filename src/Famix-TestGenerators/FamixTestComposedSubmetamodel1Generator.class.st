Class {
	#name : #FamixTestComposedSubmetamodel1Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'classEntity',
		'method'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTestComposedSubmetamodel1Generator class >> packageName [ 

	^ 'Famix-TestComposedSubmetamodel1-Entities'


]

{ #category : #accessing }
FamixTestComposedSubmetamodel1Generator class >> prefix [

	^ #FamixTestComposed1
]

{ #category : #definition }
FamixTestComposedSubmetamodel1Generator >> defineClasses [

	super defineClasses.

	classEntity := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
]

{ #category : #definition }
FamixTestComposedSubmetamodel1Generator >> defineHierarchy [ 

	super defineHierarchy.

	classEntity --|> namedEntity.
	classEntity --|> #TClass.
	classEntity --|> #TWithMethods.

	method --|> namedEntity.
	method --|> #TMethod.

]
