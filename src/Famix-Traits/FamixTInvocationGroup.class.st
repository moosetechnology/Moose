Class {
	#name : #FamixTInvocationGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixTInvocationGroup class >> annotation [

	<FMClass: #TInvocationGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixTInvocationGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #export }
FamixTInvocationGroup >> exportToCsvStream: stream [
	(NeoCSVWriter on: stream)
		fieldWriter: #raw;
		lineEndConvention: #cr;
		nextPut: #('FromNamespace' 'FromClass' 'FromMethod' 'ToNamespace' 'ToClass' 'ToMethod');
		fieldWriter: #quoted;
		addFields:
			{[ :inv | (inv source atScope: FamixTNamespace) anyOne mooseName ] . [ :inv | (inv source atScope: FamixTType) anyOne name ].
			[ :inv | inv source signature ] . [ :inv | (inv anyCandidate atScope: FamixTNamespace) anyOne mooseName ].
			[ :inv | (inv anyCandidate atScope: FamixTType) anyOne name ] . [ :inv | inv anyCandidate signature ]};
		nextPutAll: self
]
