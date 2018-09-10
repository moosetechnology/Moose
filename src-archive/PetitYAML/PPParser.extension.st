Extension { #name : #PPParser }

{ #category : #'*PetitYAML' }
PPParser >> YAMLBlockIn [
	^ self >=> [:context :cc |
		| retval aYAMLContext |
		aYAMLContext := context YAMLContext.
		context YAMLContext: #'block-in'.

		retval := cc value.

		context YAMLContext: aYAMLContext.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLBlockKey [
	^ self >=> [:context :cc |
		| retval aYAMLContext |
		aYAMLContext := context YAMLContext.
		context YAMLContext: #'block-key'.

		retval := cc value.

		context YAMLContext: aYAMLContext.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLBlockOut [
	^ self >=> [:context :cc |
		| retval aYAMLContext |
		aYAMLContext := context YAMLContext.
		context YAMLContext: #'block-out'.

		retval := cc value.

		context YAMLContext: aYAMLContext.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLFlowIn [
	^ self >=> [:context :cc |
		| retval aYAMLContext |
		aYAMLContext := context YAMLContext.
		context YAMLContext: #'flow-in'.

		retval := cc value.

		context YAMLContext: aYAMLContext.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLFlowKey [
	^ self >=> [:context :cc |
		| retval aYAMLContext |
		aYAMLContext := context YAMLContext.
		context YAMLContext: #'flow-key'.

		retval := cc value.

		context YAMLContext: aYAMLContext.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLFlowOut [
	^ self >=> [:context :cc |
		| retval aYAMLContext |
		aYAMLContext := context YAMLContext.
		context YAMLContext: #'flow-out'.

		retval := cc value.

		context YAMLContext: aYAMLContext.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLM [
	^ self >=> [:context :cc |
		| retval |
		context YAMLN: (context YAMLM).

		retval := cc value.
	
		context YAMLRestoreN.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLNPlus [
	^ self >=> [:context :cc |
		| retval lastIndent |
		lastIndent := context YAMLN.
		context YAMLN: (lastIndent + 1).

		retval := cc value.
	
		context YAMLRestoreN.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLPlusM [
	^ self >=> [:context :cc |
		| retval lastIndent |
		lastIndent := context YAMLN.
		context YAMLN: (lastIndent + context YAMLM).

		retval := cc value.
	
		context YAMLRestoreN.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLSeqSpaces [
	^ self >=> [:context :cc |
		| retval lastIndent |
		lastIndent := context YAMLN.
		(context YAMLContext = #'block-out') ifTrue: [ 
			context YAMLN: (lastIndent - 1).
		] ifFalse: [ 
			(context YAMLContext = #'block-in') ifFalse: [ self error: 'OOUPSLA' ].
			context YAMLN: lastIndent.
		].

		retval := cc value.
		
		context YAMLRestoreN.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> YAMLinFlow [
	^ self >=> [:context :cc |
		| retval aYAMLContext |
		aYAMLContext := context YAMLContext.
		(context YAMLContext = #'flow-out')	ifTrue: [ context YAMLContext: #'flow-in' ].
		(context YAMLContext = #'flow-in') 	ifTrue: [ context YAMLContext: #'flow-in' ].
		(context YAMLContext = #'block-key') ifTrue: [ context YAMLContext: #'flow-key' ].
		(context YAMLContext = #'flow-key') 	ifTrue: [ context YAMLContext: #'flow-key' ].
		
		retval := cc value.

		context YAMLContext: aYAMLContext.
		retval.
	]
]

{ #category : #'*PetitYAML' }
PPParser >> preceeds [
	^ self >=> [ :context :cc |
		| memento result |
		(context position = 0) ifTrue: [ 
			PPFailure message: 'nothing preceeds start of stream' context: context 
		] ifFalse: [ 
			memento := context remember.
			
			context back	.
			result := cc value.
			
			context restore: memento.
			result
		]
	]
]
