Extension { #name : #FamixInvocationGroup }

{ #category : #'*Moose-Finder' }
FamixInvocationGroup >> exportToCsvStream: stream [

	(NeoCSVWriter on: stream)
		fieldWriter: #raw;
		lineEndConvention: #cr;
		nextPut:
			#( 'FromPackage' 'FromClass' 'FromMethod' 'ToPackage' 'ToClass'
			   'ToMethod' );
		fieldWriter: #quoted;
		addFields: { 
				[ :inv | (inv source atScope: FamixTPackage) anyOne mooseName ].
				[ :inv | (inv source atScope: FamixTType) anyOne name ].
				[ :inv | inv source signature ].
				[ :inv | 
				(inv anyCandidate atScope: FamixTPackage) anyOne mooseName ].
				[ :inv | (inv anyCandidate atScope: FamixTType) anyOne name ].
				[ :inv | inv anyCandidate signature ] };
		nextPutAll: self
]
