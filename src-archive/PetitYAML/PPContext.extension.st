Extension { #name : #PPContext }

{ #category : #'*PetitYAML' }
PPContext >> YAMLChomp [
	^ self propertyAt: #YAMLChomp ifAbsent: #'keep'
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLChomp: whatever [
	self propertyAt: #YAMLChomp put: whatever
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLContext [
	^ self propertyAt: #YAMLContext ifAbsent: #'flow-in'
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLContext: whatever [
	self propertyAt: #YAMLContext put: whatever
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLM [
	^ self propertyAt: #YAMLM ifAbsent: [ ^ 1 ]
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLM: whatever [
	self propertyAt: #YAMLM put: whatever
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLN [
	self indentStack isEmpty ifTrue: [ ^ 1 ].
	^ self indentStack top column
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLN: whatever [
	| compare |
	compare := PPCompareParser 
					on: [ :ctx | ctx column = whatever  ] 
					message: 'expected level: ', whatever asString
					column: whatever.

	self indentStack push: compare.
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLRestoreM [
	^ self indentTraces pop: #YAMLM
]

{ #category : #'*PetitYAML' }
PPContext >> YAMLRestoreN [
	^ self indentStack pop
]
