Extension { #name : #String }

{ #category : #'*Magritte-Model' }
String >> matches: aString [
	aString isEmpty ifTrue: [ ^ true ].
	^ (aString includesAnyOf: '*#')
		ifTrue: [ aString match: self ]
		ifFalse: [ self includesSubstring: aString caseSensitive: false ]
]

{ #category : #'*magritte-model' }
String >> normalizeCamelCase [

	^ String streamContents: [ :out |
		self do: [ :e |
			(e isUppercase and: [ out position > 0 ]) ifTrue: [ out nextPut: Character space ].
			out nextPut: e ] ]
]
