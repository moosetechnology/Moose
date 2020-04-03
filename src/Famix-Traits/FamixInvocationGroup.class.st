Class {
	#name : #FamixInvocationGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Traits-Entities'
}

{ #category : #meta }
FamixInvocationGroup class >> annotation [

	<FMClass: #InvocationGroup super: #MooseGroup>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #meta }
FamixInvocationGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #'as yet unclassified' }
FamixInvocationGroup >> exportToCsvStream: stream [
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
