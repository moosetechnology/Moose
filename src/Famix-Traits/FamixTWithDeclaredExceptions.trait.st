Trait {
	#name : #FamixTWithDeclaredExceptions,
	#instVars : [
		'#declaredExceptions => FMMany type: #FamixTDeclaredException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-DeclaredException'
}

{ #category : #meta }
FamixTWithDeclaredExceptions classSide >> annotation [

	<FMClass: #TWithDeclaredExceptions super: #Object>
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
	<FMComment: 'The exceptions declared by the method'>
	<derived>
	^ declaredExceptions
]

{ #category : #accessing }
FamixTWithDeclaredExceptions >> declaredExceptions: anObject [

	<generated>
	declaredExceptions value: anObject
]
