Class {
	#name : #FamixTagTestingGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'method',
		'attribute',
		'access',
		'invocation',
		'class',
		'package',
		'entity',
		'sourceTextAnchor'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTagTestingGenerator class >> packageName [
	^ #'Famix-Tagging-Tests-Entities'
]

{ #category : #accessing }
FamixTagTestingGenerator class >> prefix [
	^ #FamixTagTest
]

{ #category : #accessing }
FamixTagTestingGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #definition }
FamixTagTestingGenerator >> defineClasses [
	super defineClasses.

	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute.
	access := builder newClassNamed: #Access.
	invocation := builder newClassNamed: #Invocation.
	package := builder newClassNamed: #Package.

	entity := builder newClassNamed: #Entity.
	sourceTextAnchor := builder newClassNamed: #SourceTextAnchor.
]

{ #category : #definition }
FamixTagTestingGenerator >> defineHierarchy [
	super defineHierarchy.

	access --|> entity.
	access --|> #TAccess.

	attribute --|> entity.
	attribute --|> #TAttribute.

	class --|> entity.
	class --|> #TClass.
	class --|> #TSourceEntity.

	invocation --|> entity.
	invocation --|> #TInvocation.

	method --|> entity.
	method --|> #TMethod.
	method --|> #TSourceEntity.

	package --|> entity.
	package --|> #TPackage.
	package --|> #TWithTypes.
	package --|> #TNamedEntity.

	sourceTextAnchor --|> #TSourceAnchor.
	sourceTextAnchor --|> #THasImmediateSource
]
