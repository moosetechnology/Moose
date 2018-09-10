Class {
	#name : #FamixStComment,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStComment class >> annotation [

	<MSEClass: #Comment super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStComment class >> generatedSlotNames [
	<generated>
	'FamixStComment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStComment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FamixStComment class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixStComment >> belongsTo [
	
	^ self container
]
