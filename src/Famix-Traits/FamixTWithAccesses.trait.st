Trait {
	#name : #FamixTWithAccesses,
	#instVars : [
		'#accesses => FMMany type: #FamixTAccess opposite: #accessor'
	],
	#category : #'Famix-Traits-Access'
}

{ #category : #meta }
FamixTWithAccesses classSide >> annotation [

	<MSEClass: #TWithAccesses super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithAccesses classSide >> generatedSlotNames [
	<generated>
	'FamixTWithAccesses class>>#generatedSlotNames'.
	^ #(accesses)
]

{ #category : #generator }
FamixTWithAccesses classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithAccesses >> accesses [

	<generated>
	<MSEComment: 'Accesses to variables made by this behaviour.'>
	^ accesses
]

{ #category : #accessing }
FamixTWithAccesses >> accesses: anObject [

	<generated>
	accesses value: anObject

]

{ #category : #adding }
FamixTWithAccesses >> addAccess: anAccess [ 
	accesses add: anAccess
]
