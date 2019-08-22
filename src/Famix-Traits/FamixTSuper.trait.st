Trait {
	#name : #FamixTSuper,
	#instVars : [
		'#subs => FMMany type: #FamixTSub opposite: #supers'
	],
	#category : #'Famix-Traits-Inheritance-Simple'
}

{ #category : #meta }
FamixTSuper classSide >> annotation [

	<MSEClass: #TSuper super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTSuper >> addSub: anObject [

	subs add: anObject

]

{ #category : #accessing }
FamixTSuper >> subs [
	"Relation named: #subs type: #FamixTSub opposite: #supers"

	<generated>
	^ subs
]

{ #category : #accessing }
FamixTSuper >> subs: anObject [

	<generated>
	subs value: anObject

]
