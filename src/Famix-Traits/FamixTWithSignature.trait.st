Trait {
	#name : #FamixTWithSignature,
	#instVars : [
		'#signature => FMProperty'
	],
	#category : #'Famix-Traits-Signature'
}

{ #category : #meta }
FamixTWithSignature classSide >> annotation [

	<FMClass: #TWithSignature super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithSignature >> signature [

	<FMProperty: #signature type: #String>
	<generated>
	<FMComment: 'Signature of the message being sent'>
	^ signature
]

{ #category : #accessing }
FamixTWithSignature >> signature: anObject [

	signature := anObject.
	self resetMooseName.

]
