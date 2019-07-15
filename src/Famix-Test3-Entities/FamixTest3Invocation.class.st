Class {
	#name : #FamixTest3Invocation,
	#superclass : #FamixTest3Association,
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Invocation class >> annotation [

	<MSEClass: #Invocation super: #FamixTest3Association>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Invocation class >> generatedSlotNames [
	<generated>
	'FamixTest3Invocation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Invocation class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocation)
]

{ #category : #meta }
FamixTest3Invocation class >> requirements [

	<generated>
	^ {  }
]
