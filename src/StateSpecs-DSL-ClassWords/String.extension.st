Extension { #name : #String }

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> matchingCaseSensitiveRegex: requiredString [

	^SpecOfStringRegex requiredValue: requiredString caseSensitive: true
]

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> matchingRegex: requiredString [

	^SpecOfStringRegex requiredValue: requiredString
]

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> withBeginning: requiredString [

	^SpecOfStringBeginning requiredValue: requiredString
]

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> withCaseSensitiveBeginning: requiredString [

	^SpecOfStringBeginning requiredValue: requiredString caseSensitive: true
]

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> withCaseSensitiveEnding: requiredString [

	^SpecOfStringEnding requiredValue: requiredString caseSensitive: true
]

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> withCaseSensitiveSubstring: requiredString [

	^SpecOfSubstring requiredValue: requiredString caseSensitive: true
]

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> withEnding: requiredString [

	^SpecOfStringEnding requiredValue: requiredString
]

{ #category : #'*StateSpecs-DSL-ClassWords' }
String class >> withSubstring: requiredString [

	^SpecOfSubstring requiredValue: requiredString
	
]
