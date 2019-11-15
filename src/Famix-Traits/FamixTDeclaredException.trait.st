"
This is an exception explicitly declared as being thrown by a method.
"
Trait {
	#name : #FamixTDeclaredException,
	#instVars : [
		'#definingEntity => FMOne type: #FamixTWithDeclaredExceptions opposite: #declaredExceptions'
	],
	#category : #'Famix-Traits-DeclaredException'
}

{ #category : #meta }
FamixTDeclaredException classSide >> annotation [

	<FMClass: #TDeclaredException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTDeclaredException >> definingEntity [
	"Relation named: #definingEntity type: #FamixTWithDeclaredExceptions opposite: #declaredExceptions"

	<generated>
	^ definingEntity
]

{ #category : #accessing }
FamixTDeclaredException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject
]
