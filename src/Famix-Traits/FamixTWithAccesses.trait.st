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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithAccesses >> accesses [
	"Relation named: #accesses type: #FamixTAccess opposite: #accessor"

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
