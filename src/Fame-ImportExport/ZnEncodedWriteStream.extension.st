Extension { #name : #ZnEncodedWriteStream }

{ #category : #'*Fame-ImportExport' }
ZnEncodedWriteStream >> next: anInteger put: anObject [ 
	<compilerOptions: #(+ optionInlineTimesRepeat)>
	
	"Make anObject be the next anInteger number of objects accessible by the 
	receiver. Answer anObject."
	
	anInteger timesRepeat: [ self nextPut: anObject ].
	^ anObject
]
