Trait {
	#name : #FamixTSub,
	#instVars : [
		'#supers => FMOne type: #FamixTSuper opposite: #subs'
	],
	#category : #'Famix-Traits-Inheritance-Simple'
}

{ #category : #meta }
FamixTSub classSide >> annotation [

	<MSEClass: #TSub super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #accessing }
FamixTSub >> supers [

	<generated>
	^ supers
]

{ #category : #accessing }
FamixTSub >> supers: anObject [

	<generated>
	supers := anObject

]
