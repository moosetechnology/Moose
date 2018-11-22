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
	stream 
		nextPutAll: 'FromNamespace,FromClass,FromMethod,ToNamespace,ToClass,ToMethod';
		cr.
	self 
		do: [ :inv |
			stream 
				nextPutAll: '"';
				nextPutAll: inv from namespaceScope mooseName;
				nextPutAll: '","';
				nextPutAll: inv from typeScope name;
				nextPutAll: '","';
				nextPutAll: inv from signature;
				nextPutAll: '","';
				nextPutAll: inv anyCandidate namespaceScope mooseName;
				nextPutAll: '","';
				nextPutAll: inv anyCandidate typeScope name;
				nextPutAll: '","';
				nextPutAll: inv anyCandidate signature;
				nextPutAll: '"' ]
		separatedBy: [ stream cr ]
]
