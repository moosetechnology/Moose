"
ParameterType represents the symbolic type used in parameterizable classes. This is a FAMIXType.

Example:
public class AClass<A,B,C> {
...
}

Where AClass is a ParameterizableClass. A, B and C are ParameterType of AClass.
"
Trait {
	#name : #FamixTParameterType,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTParameterType classSide >> annotation [

	<FMClass: #TParameterType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]
