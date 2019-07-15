Extension { #name : #FMMultiMultivalueLink }

{ #category : #'*Moose-SmalltalkImporter-nocheckAdding' }
FMMultiMultivalueLink >> nocheckAdd: anElement [ 
	(anElement perform: opposite) nocheckUnsafeAdd: owner.
	"(values includes: anElement) not ifTrue: [ "
	values add: anElement.	"]"
	^ anElement
]

{ #category : #'*Moose-SmalltalkImporter-nocheckAdding' }
FMMultiMultivalueLink >> nocheckAddAll: aCollection [ 
	"Include all the elements of aCollection as the receiver's elements. Answer 
	aCollection. Actually, any object responding to #do: can be used as argument."
	aCollection do: [ :each | self nocheckAdd: each ].
	^ aCollection
]

{ #category : #'*Moose-SmalltalkImporter-nocheckAdding' }
FMMultiMultivalueLink >> nocheckUnsafeAdd: element [ 
	values add: element
]

{ #category : #'*Moose-SmalltalkImporter-nocheckAdding' }
FMMultiMultivalueLink >> nocheckValue: aCollection [ 
	^ self
		removeAll: values copy;
		nocheckAddAll: aCollection
]
