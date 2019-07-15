Extension { #name : #PP2Node }

{ #category : #'*PetitJava' }
PP2Node >> javaToken [
	^ (self token: PPJavaToken) trim: PPJavaWhitespaceParser instance
]
