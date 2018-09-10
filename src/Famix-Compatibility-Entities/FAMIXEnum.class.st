Class {
	#name : #FAMIXEnum,
	#superclass : #FAMIXType,
	#traits : 'FamixTWithEnumValues',
	#classTraits : 'FamixTWithEnumValues classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXEnum class >> annotation [

	<MSEClass: #Enum super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXEnum class >> generatedSlotNames [
	<generated>
	'FAMIXEnum class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXEnum class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithEnumValues)
]

{ #category : #meta }
FAMIXEnum class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FAMIXEnum >> values [
	^ self enumValues
]

{ #category : #accessing }
FAMIXEnum >> values: anObject [
	self enumValues: anObject
]
