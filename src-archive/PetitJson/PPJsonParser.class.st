Class {
	#name : #PPJsonParser,
	#superclass : #PPJsonGrammar,
	#category : #'PetitJson-Core'
}

{ #category : #grammar }
PPJsonParser >> array [
	^ super array ==> [ :nodes | Array withAll: (nodes second ifNil: [ #() ]) ]
]

{ #category : #primitives }
PPJsonParser >> charEscape [
	^ super charEscape ==> [ :nodes | CharacterTable at: nodes last ]
]

{ #category : #primitives }
PPJsonParser >> charOctal [
	^ super charOctal ==> [ :nodes |
		Character value: (nodes last allButFirst
			inject: nodes last first digitValue
			into: [ :result :each | (result << 4) + each digitValue ]) ]
]

{ #category : #grammar }
PPJsonParser >> elements [
	^ super elements ==> [ :nodes | nodes reject: [ :each | each isKindOf: PPToken ] ]
]

{ #category : #tokens }
PPJsonParser >> falseToken [
	^ super falseToken ==> [ :token | false ]
]

{ #category : #grammar }
PPJsonParser >> members [
	^ super members ==> [ :nodes | nodes reject: [ :each | each isKindOf: PPToken ] ]
]

{ #category : #tokens }
PPJsonParser >> nullToken [
	^ super nullToken  ==> [ :token | nil ]
]

{ #category : #tokens }
PPJsonParser >> numberToken [
	^ super numberToken ==> [ :token | (token value copyWithout: $+) asLowercase asNumber ]
]

{ #category : #grammar }
PPJsonParser >> object [
	^ super object ==> [ :nodes |
		(nodes second ifNil: [ #() ])
			inject: Dictionary new
			into: [ :result :each | 
				result
					add: each;
					yourself ] ]
]

{ #category : #grammar }
PPJsonParser >> pair [
	^ super pair map: [ :key :sep :val | key -> val ]
]

{ #category : #tokens }
PPJsonParser >> stringToken [
	^ string trim ==> [ :nodes | String withAll: nodes second ]
]

{ #category : #tokens }
PPJsonParser >> trueToken [
	^ super trueToken ==> [ :token | true ]
]
