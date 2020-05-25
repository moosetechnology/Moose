Trait {
	#name : #FamixTPrimitiveType,
	#traits : 'FamixTType',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTPrimitiveType classSide >> annotation [

	<FMClass: #TPrimitiveType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTPrimitiveType >> isPrimitiveType [

	<generated>
	^ true
]
