Extension { #name : #FAMIXSmalltalkSourceLanguage }

{ #category : #'*FamixCompatibility-PPExtensions' }
FAMIXSmalltalkSourceLanguage >> parser [
	^ self privateState attributeAt: #parser ifAbsentPut: [PPSmalltalkGrammar new]
]
