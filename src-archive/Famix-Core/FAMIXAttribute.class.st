"
FAMIXAttribute represents a field of a class. It is an attribute of the parent type.

"
Class {
	#name : #FAMIXAttribute,
	#superclass : #FAMIXStructuralEntity,
	#instVars : [
		'hasClassScope',
		'parentType'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXAttribute class >> annotation [
	<MSEClass: #Attribute super: #FAMIXStructuralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXAttribute >> belongsTo [

	^ self parentType
]

{ #category : #accessing }
FAMIXAttribute >> belongsTo: aType [
	self parentType
]

{ #category : #accessing }
FAMIXAttribute >> hasClassScope [
	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'True if class-side attribute'>

	^ hasClassScope
]

{ #category : #accessing }
FAMIXAttribute >> hasClassScope: aBoolean [

	hasClassScope := aBoolean
]

{ #category : #'initialize-release' }
FAMIXAttribute >> initialize [
	super initialize.
	hasClassScope := false.

]

{ #category : #'moosechef-scoping-filtering' }
FAMIXAttribute >> namespaceScope [
	^ self parentType namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXAttribute >> packageScope [
	^ self parentType packageScope
]

{ #category : #accessing }
FAMIXAttribute >> parentType [
	<MSEProperty: #parentType type: #FAMIXType opposite: #attributes>
	<MSEComment: 'Type declaring the attribute. belongsTo implementation'>
	<container>
	^ parentType
]

{ #category : #accessing }
FAMIXAttribute >> parentType: aType [ 
	parentType := FMMultivalueLink 
		on: self
		update: #attributes
		from: self parentType
		to: aType.
	self resetMooseName
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXAttribute >> typeScope [
	^ self parentType
]
