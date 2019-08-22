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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTSub >> supers [
	"Relation named: #supers type: #FamixTSuper opposite: #subs"

	<generated>
	^ supers
]

{ #category : #accessing }
FamixTSub >> supers: anObject [

	<generated>
	supers := anObject

]
