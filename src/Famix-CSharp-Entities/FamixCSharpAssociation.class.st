Class {
	#name : #FamixCSharpAssociation,
	#superclass : #FamixCSharpSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpAssociation class >> annotation [

	<MSEClass: #Association super: #FamixCSharpSourcedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
