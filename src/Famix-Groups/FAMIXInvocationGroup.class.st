Class {
	#name : #FAMIXInvocationGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXInvocationGroup class >> annotation [
	<FMClass: #InvocationGroup super: #MooseGroup>
	<package: #FAMIX>

]

{ #category : #export }
FAMIXInvocationGroup >> exportToCsvStream: stream [
	(NeoCSVWriter on: stream)
		fieldWriter: #raw;
		lineEndConvention: #cr;
		nextPut: #('FromNamespace' 'FromClass' 'FromMethod' 'ToNamespace' 'ToClass' 'ToMethod');
		fieldWriter: #quoted;
		addFields:
			{[ :inv | (inv from atScope: FamixTNamespace) anyOne mooseName ] . [ :inv | (inv from atScope: FamixTType) anyOne name ] . [ :inv | inv from signature ] . [ :inv | (inv anyCandidate atScope: FamixTNamespace) anyOne mooseName ].
			[ :inv | (inv anyCandidate atScope: FamixTType) anyOne name ] . [ :inv | inv anyCandidate signature ]};
		nextPutAll: self
]
