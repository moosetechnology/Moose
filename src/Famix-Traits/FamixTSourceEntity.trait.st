"
FAMIXSourcedEntity models any fact in a program source and it is the superclass (root class) of all source code entities and their relationships. It is a FAMIXEntity and it can hold comments, a source anchor and a source language.
"
Trait {
	#name : #FamixTSourceEntity,
	#instVars : [
		'#isStub => FMProperty'
	],
	#traits : 'FamixTWithSourceAnchor + FamixTWithSourceLanguage + FamixTWithComments',
	#classTraits : 'FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTSourceEntity classSide >> annotation [

	<FMClass: #TSourceEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'source anchor' }
FamixTSourceEntity >> defineMultiSourceAnchorWithPath: aPath [
	 self ensureMultiSourceAnchor addFileAnchorWithPath: aPath
]

{ #category : #'source anchor' }
FamixTSourceEntity >> ensureMultiSourceAnchor [
	^ self sourceAnchor
		ifNil: [ self
				sourceAnchor:
					(self multipleFileAnchorClass new
						element: self;
						mooseModel: self mooseModel;
						yourself);
				sourceAnchor ]
]

{ #category : #accessing }
FamixTSourceEntity >> isStub [

	<FMProperty: #isStub type: #Boolean>
	<FMComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub ifNil: [ false ]
]

{ #category : #accessing }
FamixTSourceEntity >> isStub: anObject [
	<generated>
	isStub := anObject
]

{ #category : #'source anchor' }
FamixTSourceEntity >> multipleFileAnchorClass [
	^ self mooseModel
		ifNil: [ self error: 'The model need to be set for this feature to work.' ]
		ifNotNil: [ :model | 
			model factory
				entityNamed: #MultipleFileAnchor
				ifAbsent: [ self error: 'This metamodel does not includes the full concept of MultipleFileAnchor needed.' ] ]
]
