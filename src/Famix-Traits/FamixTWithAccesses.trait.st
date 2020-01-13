Trait {
	#name : #FamixTWithAccesses,
	#instVars : [
		'#accesses => FMMany type: #FamixTAccess opposite: #accessor'
	],
	#category : #'Famix-Traits-Access'
}

{ #category : #meta }
FamixTWithAccesses classSide >> annotation [

	<FMClass: #TWithAccesses super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithAccesses >> accesses [
	"Relation named: #accesses type: #FamixTAccess opposite: #accessor"

	<generated>
	<FMComment: 'Accesses to variables made by this behaviour.'>
	<derived>
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
