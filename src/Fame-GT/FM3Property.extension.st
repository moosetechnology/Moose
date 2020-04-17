Extension { #name : #FM3Property }

{ #category : #'*Fame-GT' }
FM3Property >> gtDisplayOn: stream [
	stream nextPutAll: self fullName
]

{ #category : #'*Fame-GT' }
FM3Property >> gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: 0>
	self hasImplementingSelector ifTrue: [
		self compiledMethod ifNotNil: [ :c | c asRingDefinition gtInspectorSourceIn: composite ] ]
]

{ #category : #'*Fame-GT' }
FM3Property >> gtTypeString [
	^ String
		streamContents: [ :s | 
			self type ifNotNil: [ :t | s nextPutAll: t name ].
			self isMultivalued ifTrue: [ s nextPutAll: ' *' ].
			self isDerived ifTrue: [ s nextPutAll: ' /' ] ]
]
