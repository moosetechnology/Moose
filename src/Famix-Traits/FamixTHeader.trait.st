"
I represent a header file. Typically a .h or .hpp
"
Trait {
	#name : #FamixTHeader,
	#instVars : [
		'#headerOwner => FMOne type: #FamixTWithHeader opposite: #header'
	],
	#category : #'Famix-Traits-Header'
}

{ #category : #meta }
FamixTHeader classSide >> annotation [

	<MSEClass: #THeader super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTHeader >> headerOwner [
	"Relation named: #headerOwner type: #FamixTWithHeader opposite: #header"

	<generated>
	^ headerOwner
]

{ #category : #accessing }
FamixTHeader >> headerOwner: anObject [

	<generated>
	headerOwner := anObject

]
