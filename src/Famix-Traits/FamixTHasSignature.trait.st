"
The signature of any behavioural entity
"
Trait {
	#name : #FamixTHasSignature,
	#instVars : [
		'#signature => FMProperty'
	],
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTHasSignature classSide >> annotation [

	<FMClass: #THasSignature super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTHasSignature >> signature [

	<FMProperty: #signature type: #String>
	<generated>
	<FMComment: 'Signature of the message being sent'>
	^ signature
]

{ #category : #accessing }
FamixTHasSignature >> signature: anObject [
	<generated>
	signature := anObject
]
