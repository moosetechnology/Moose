Class {
	#name : #FAMIXAssociation,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAssociation class >> annotation [

	<MSEClass: #Association super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXAssociation class >> generatedSlotNames [
	<generated>
	'FAMIXAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXAssociation class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FAMIXAssociation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXAssociation >> accept: aVisitor [

	aVisitor visitAssociation: self
]

{ #category : #accessing }
FAMIXAssociation >> anyTo [
	"This is a utility method that could be used polymorphically to obtain exactly one
	target entity even when the internal implementation stores these as a collection"
	^ self to asOrderedCollection anyOne
]

{ #category : #'Famix-Extensions' }
FAMIXAssociation >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	"self previous: (aVisitor visit: anEntity previous)."
]

{ #category : #accessing }
FAMIXAssociation >> from [
	"Polymorphic accessor to the entity originating the association.
	It should be refined by subclasses by delegating to a concrete property.
	This property should always remain derived."
	
	<MSEProperty: #from type: #FAMIXNamedEntity> <derived>
	<MSEComment: 'Generic accessor to the entity originating the association. Refined by subclasses'>
	^ self subclassResponsibility
]

{ #category : #printing }
FAMIXAssociation >> gtDisplayOn: aStream [
	self from gtDisplayOn: aStream.
	aStream nextPutAll: ' -> '.
	self to gtDisplayOn: aStream	
]

{ #category : #accessing }
FAMIXAssociation >> previous: anAssociation [
	| old |
	previous = anAssociation
		ifTrue: [ ^ self ].
	old := previous.
	previous := anAssociation.
	old ifNotNil: [ old next: nil ].
	anAssociation ifNotNil: [ anAssociation next: self ]
]

{ #category : #accessing }
FAMIXAssociation >> to [
	"Polymorphic accessor to the target entity of the association.
	It should be refined by subclasses by delegating to a concrete property.
	This property should always remain derived."

	<MSEProperty: #to type: #FAMIXNamedEntity> <derived>
	<MSEComment: 'Generic accessor to the target entity of the association'>
	^ self subclassResponsibility
]
