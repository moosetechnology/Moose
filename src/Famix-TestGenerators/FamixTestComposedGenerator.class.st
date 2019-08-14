Class {
	#name : #FamixTestComposedGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'association',
		'entity',
		'customEntity1',
		'customEntity2',
		'customEntity3',
		'customEntity4'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTestComposedGenerator class >> packageName [ 

	^ 'Famix-TestComposedMetamodel-Entities'
]

{ #category : #accessing }
FamixTestComposedGenerator class >> prefix [

	^ #FamixTestComposed
]

{ #category : #accessing }
FamixTestComposedGenerator class >> submetamodels [

	^ { FamixTestComposedSubmetamodel1Generator. FamixTestComposedSubmetamodel2Generator }
]

{ #category : #definition }
FamixTestComposedGenerator >> define [ 

	| test1Method test2Class test1Custom1 test1Custom2 test1Custom3 test1Custom4 test2Custom1 test2Custom2 test2Custom3 test2Custom4 test1Custom5 test2Custom5 |
	
	super define.
	
	entity := builder newClassNamed: #Entity.
	
	test1Method := self remoteEntity: #Method withPrefix: #FamixTestComposed1.
	test2Class := self remoteEntity: #Class withPrefix: #FamixTestComposed2.
	
	test1Custom1 := self remoteEntity: #CustomEntity1 withPrefix: #FamixTestComposed1.
	test1Custom2 := self remoteEntity: #CustomEntity2 withPrefix: #FamixTestComposed1.
	test1Custom3 := self remoteEntity: #CustomEntity3 withPrefix: #FamixTestComposed1.
	test1Custom4 := self remoteEntity: #CustomEntity4 withPrefix: #FamixTestComposed1.

	test2Custom1 := self remoteEntity: #CustomEntity1 withPrefix: #FamixTestComposed2.
	test2Custom2 := self remoteEntity: #CustomEntity2 withPrefix: #FamixTestComposed2.
	test2Custom3 := self remoteEntity: #CustomEntity3 withPrefix: #FamixTestComposed2.
	test2Custom4 := self remoteEntity: #CustomEntity4 withPrefix: #FamixTestComposed2.

	customEntity1 := builder newClassNamed: #CustomEntity1.
	customEntity2 := builder newClassNamed: #CustomEntity2.
	customEntity3 := builder newClassNamed: #CustomEntity3.
	customEntity4 := builder newClassNamed: #CustomEntity4.

	entity - test1Method.

	customEntity1 <>- test1Custom1.
	customEntity2 -* test1Custom2.	
	customEntity3 *- test1Custom3.	
	customEntity4 *-* test1Custom4.		

	(customEntity1 property: #c21) - (test2Custom1 property: #c1).
	(customEntity2 property: #c22s) -* (test2Custom2 property: #c2).
	(customEntity3 property: #c23)  *- (test2Custom3 property: #c3s).
	(customEntity4 property: #c24s) *-* (test2Custom4 property: #c4s).

	(test1Custom1 property: #c21) - (test2Custom1 property: #c11).
	(test1Custom2 property: #c22s) -* (test2Custom2 property: #c12).
	(test1Custom3 property: #c23)  *- (test2Custom3 property: #c13s).
	(test1Custom4 property: #c24s) *-* (test2Custom4 property: #c14s).

	association := builder newClassNamed: #Association.
	association --|> entity.
	association --|> #TAssociationMetaLevelDependency.

	test1Custom5 := self remoteEntity: #CustomEntity5 withPrefix: #FamixTestComposed1.
	test2Custom5 := self remoteEntity: #CustomEntity5 withPrefix: #FamixTestComposed2.
	(test1Custom5 property: #associations) -* ((association property: #c15) target).
	((association property: #c25) source) *- (test2Custom5 property: #associations)
]

{ #category : #definition }
FamixTestComposedGenerator >> newBuilder [

	| mqBuilder |

	mqBuilder := FamixMooseQueryGenerator builderWithDefinitions.

	self adoptBuilder: mqBuilder.

	^ mqBuilder
		doNotGenerateCurrent;
		generator: self;
		yourself.
]
