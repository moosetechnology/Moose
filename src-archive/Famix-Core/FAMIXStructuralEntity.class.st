"
FAMIXStructuralEntity is the abstract superclass for basic data structure in the source code. A structural entity has a declaredType that points to the type of the variable.
"
Class {
	#name : #FAMIXStructuralEntity,
	#superclass : #FAMIXLeafEntity,
	#instVars : [
		'declaredType',
		'incomingAccesses'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXStructuralEntity class >> annotation [
	<MSEClass: #StructuralEntity super: #FAMIXLeafEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXStructuralEntity >> accessors [
	<MSEProperty: #accessors type: #FAMIXBehaviouralEntity> <multivalued> <derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : #accessing }
FAMIXStructuralEntity >> addIncomingAccess: anAccess [
	incomingAccesses add: anAccess
]

{ #category : #accessing }
FAMIXStructuralEntity >> declaredType [
	<MSEProperty: #declaredType type: #FAMIXType opposite: #structuresWithDeclaredType>
	<MSEComment: 'Type of the structure, if any'>
	
	^declaredType
]

{ #category : #accessing }
FAMIXStructuralEntity >> declaredType: aType [
	declaredType :=  FMMultivalueLink on: self
					update: #structuresWithDeclaredType 
					from: self declaredType
					to: aType
]

{ #category : #accessing }
FAMIXStructuralEntity >> incomingAccesses [
	<MSEProperty: #incomingAccesses type: #FAMIXAccess opposite: #variable> <multivalued> <derived>
	<MSEComment: 'All Famix accesses pointing to this structural entity'>
	
	^incomingAccesses
]

{ #category : #accessing }
FAMIXStructuralEntity >> incomingAccesses: anAccess [
	incomingAccesses value: anAccess
]

{ #category : #'initialize-release' }
FAMIXStructuralEntity >> initialize [
	super initialize.
	incomingAccesses := FMNullMultivalueLink on: self opposite: #variable: selector: #incomingAccesses.
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> namespaceScope [
	^ self parentType namespaceScope
]

{ #category : #'moosequery-queries-outgoing' }
FAMIXStructuralEntity >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseChefTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> packageScope [

	| cs |
	cs := self typeScope.
	
	^ (cs isNil) ifTrue: [nil] ifFalse: [cs packageScope]
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> typeScope [

	^ self belongsTo typeScope 
]
