Class {
	#name : #FAMIXInvocationGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Groups'
}

{ #category : #meta }
FAMIXInvocationGroup class >> annotation [
	<MSEClass: #InvocationGroup super: #MooseGroup>
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
			{[ :inv | inv from namespaceScope mooseName ] . [ :inv | inv from typeScope name ] . [ :inv | inv from signature ] . [ :inv | inv anyCandidate namespaceScope mooseName ].
			[ :inv | inv anyCandidate typeScope name ] . [ :inv | inv anyCandidate signature ]};
		nextPutAll: self
]
