Class {
	#name : #FamixTest2Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'classEntity',
		'inheritance'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest2Generator class >> packageName [

	^ #'Famix-Test2-Entities'
]

{ #category : #accessing }
FamixTest2Generator class >> prefix [

	^ #'FamixTest2'
]

{ #category : #definition }
FamixTest2Generator >> defineClasses [

	super defineClasses.

	classEntity := builder newClassNamed: #Class.
	inheritance := builder newClassNamed: #Inheritance.


]

{ #category : #definition }
FamixTest2Generator >> defineHierarchy [

	super defineHierarchy.

	classEntity --|> namedEntity.
	classEntity --|> #TClass.

	inheritance --|> association.
	inheritance --|> #TSubInheritance.
	inheritance --|> #TSuperInheritance
]
