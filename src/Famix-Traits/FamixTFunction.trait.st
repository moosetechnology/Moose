"
FAMIXFunction represents a behavioural entity in a procedural language.
"
Trait {
	#name : #FamixTFunction,
	#instVars : [
		'#functionOwner => FMOne type: #FamixTWithFunctions opposite: #functions'
	],
	#traits : 'FamixTHasSignature + FamixTNamedEntity + FamixTTypedEntity',
	#classTraits : 'FamixTHasSignature classTrait + FamixTNamedEntity classTrait + FamixTTypedEntity classTrait',
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTFunction classSide >> annotation [

	<FMClass: #TFunction super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTFunction >> functionOwner [
	"Relation named: #functionOwner type: #FamixTWithFunctions opposite: #functions"

	<generated>
	<FMComment: 'The container defining the function. The function is placed in a container, because certain languages can nest functions in functions.'>
	<container>
	^ functionOwner
]

{ #category : #accessing }
FamixTFunction >> functionOwner: anObject [

	functionOwner := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTFunction >> functionOwnerGroup [
	<generated>
	<navigation: 'FunctionOwner'>
	^ MooseGroup with: self functionOwner
]

{ #category : #testing }
FamixTFunction >> isFunction [

	<generated>
	^ true
]

{ #category : #printing }
FamixTFunction >> mooseNameOn: stream [
	| parent |
	parent := self functionOwner.
	parent
		ifNotNil: [ parent mooseNameOn: stream.
			stream nextPut: $. ].
	self signature ifNotNil: [ stream nextPutAll: self signature ] ifNil: [ self name ifNotNil: [ stream nextPutAll: self name ] ]
]
