Class {
	#name : #FamixStAssociation,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#classInstVars : [
		'#targetTypes',
		'#sourceTypes'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAssociation class >> annotation [

	<FMClass: #Association super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #printing }
FamixStAssociation >> from [

	<FMProperty: #from type: #FamixTNamed> <derived>
	<FMComment: 'Generic accessor to the entity originating the association. Refined by subclasses'>
	^ self subclassResponsibility
]

{ #category : #printing }
FamixStAssociation >> gtDisplayOn: aStream [
	self from gtDisplayOn: aStream.
	aStream nextPutAll: ' -> '.
	self to gtDisplayOn: aStream	
]

{ #category : #printing }
FamixStAssociation >> to [

	<FMProperty: #to type: #FamixTNamed> <derived>
	<FMComment: 'Generic accessor to the target entity of the association'>
	^ self subclassResponsibility
]
