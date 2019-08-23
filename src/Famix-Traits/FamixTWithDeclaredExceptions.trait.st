Trait {
	#name : #FamixTWithDeclaredExceptions,
	#instVars : [
		'#declaredExceptions => FMMany type: #FamixTDeclaredException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-DeclaredException'
}

{ #category : #meta }
FamixTWithDeclaredExceptions classSide >> annotation [

	<MSEClass: #TWithDeclaredExceptions super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithDeclaredExceptions >> addDeclaredException: aDeclaredException [
	declaredExceptions add: aDeclaredException
]

{ #category : #accessing }
FamixTWithDeclaredExceptions >> declaredExceptions [
	"Relation named: #declaredExceptions type: #FamixTDeclaredException opposite: #definingEntity"

	<generated>
	<MSEComment: 'The exceptions declared by the method'>
	^ declaredExceptions
]

{ #category : #accessing }
FamixTWithDeclaredExceptions >> declaredExceptions: anObject [

	<generated>
	declaredExceptions value: anObject

]
