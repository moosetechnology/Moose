Extension { #name : #Point }

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> differenceFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a - self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> differenceFromVector: aVector [
	
	^aVector collect: [:a | a - self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> productFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a * self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> productFromVector: aVector [
	
	^aVector collect: [:a | a * self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> quotientFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a / self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> quotientFromVector: aVector [
	
	^aVector collect: [:a | a / self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> sumFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a + self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> sumFromVector: aVector [
	
	^aVector collect: [:a | a + self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Point >> transpose [
	^ y@x
]
