Trait {
	#name : #FamixTWithSignature,
	#instVars : [
		'#signature => FMProperty'
	],
	#category : #'Famix-Traits-Signature'
}

{ #category : #meta }
FamixTWithSignature classSide >> annotation [

	<MSEClass: #TWithSignature super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
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
