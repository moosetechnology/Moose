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

	<MSEClass: #TDeclaredException super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTDeclaredException >> definingEntity [

	<generated>
	"Relation named: #definingEntity type: #FamixTWithDeclaredExceptions opposite: #declaredExceptions"

	^ definingEntity
]

{ #category : #accessing }
FamixTDeclaredException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject

]
