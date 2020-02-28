Class {
	#name : #FamixTest1Association,
	#superclass : #MooseEntity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Association class >> annotation [

	<FMClass: #Association super: #MooseEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest1Association class >> metamodel [

	<generated>
	^ FamixTest1Model metamodel
]

{ #category : #testing }
FamixTest1Association >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Association >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Association >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Association >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Association >> isType [

	<generated>
	^ false
]
