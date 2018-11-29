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

	<MSEClass: #Association super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStAssociation class >> generatedSlotNames [
	<generated>
	'FamixStAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStAssociation class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixStAssociation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #printing }
FamixStAssociation >> from [

	<MSEProperty: #from type: #FamixTNamed> <derived>
	<MSEComment: 'Generic accessor to the entity originating the association. Refined by subclasses'>
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

	<MSEProperty: #to type: #FamixTNamed> <derived>
	<MSEComment: 'Generic accessor to the target entity of the association'>
	^ self subclassResponsibility
]
