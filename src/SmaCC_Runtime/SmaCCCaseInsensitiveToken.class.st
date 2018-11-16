"
SmaCCCaseInsensitiveToken represents a case insensitive token (e.g., ""IF"" and ""if"" will compare equal).
"
Class {
	#name : #SmaCCCaseInsensitiveToken,
	#superclass : #SmaCCToken,
	#category : #'SmaCC_Runtime'
}

{ #category : #comparing }
SmaCCCaseInsensitiveToken >> = aSmaCCToken [
	^ self class = aSmaCCToken class
		and: [ self value sameAs: aSmaCCToken value ]
]

{ #category : #comparing }
SmaCCCaseInsensitiveToken >> hash [
	^ self value asUppercase hash
]
