Trait {
	#name : #FamixTWithSignature,
	#instVars : [
		'signature'
	],
	#category : #'Famix-Traits-Signature'
}

{ #category : #meta }
FamixTWithSignature classSide >> annotation [

	<MSEClass: #TWithSignature super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithSignature classSide >> generatedSlotNames [
	<generated>
	'FamixTWithSignature class>>#generatedSlotNames'.
	^ #(signature)
]

{ #category : #generator }
FamixTWithSignature classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithSignature >> signature [

	<MSEProperty: #signature type: #String>
	<generated>
	<MSEComment: 'Signature of the message being sent'>
	^ signature
]

{ #category : #accessing }
FamixTWithSignature >> signature: anObject [

	signature := anObject.
	self resetMooseName.

]
