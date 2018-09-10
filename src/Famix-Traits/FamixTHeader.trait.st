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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTHeader classSide >> generatedSlotNames [
	<generated>
	'FamixTHeader class>>#generatedSlotNames'.
	^ #(headerOwner)
]

{ #category : #generator }
FamixTHeader classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTHeader >> headerOwner [

	<generated>
	^ headerOwner
]

{ #category : #accessing }
FamixTHeader >> headerOwner: anObject [

	<generated>
	headerOwner := anObject

]
