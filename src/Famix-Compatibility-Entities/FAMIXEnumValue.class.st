Class {
	#name : #FAMIXEnumValue,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTEnumValue',
	#classTraits : 'FamixTEnumValue classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXEnumValue class >> annotation [

	<MSEClass: #EnumValue super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXEnumValue class >> generatedSlotNames [
	<generated>
	'FAMIXEnumValue class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXEnumValue class >> generatedTraitNames [
	<generated>
	^ #(FamixTEnumValue)
]

{ #category : #meta }
FAMIXEnumValue class >> requirements [

	<generated>
	^ { FAMIXEnum }
]

{ #category : #accessing }
FAMIXEnumValue >> belongsTo [

	<generated>
	^ self parentEnum

]

{ #category : #accessing }
FAMIXEnumValue >> belongsTo: anObject [

	<generated>
	self parentEnum: anObject

]

{ #category : #'moosechef-scoping-filtering' }
FAMIXEnumValue >> namespaceScope [
	^ self parentType namespaceScope
]
