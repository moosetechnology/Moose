Extension { #name : #Number }

{ #category : #'*Geometry' }
Number >> =~ aNumber [ 
	^((self - aNumber) abs) < Number epsilon.
]

{ #category : #'*geometry' }
Number class >> epsilon [
	^ 0.00001
]

{ #category : #'*Geometry' }
Number >> isBetween: a and: b with: eps [ 
	|mi ma|
	(a =~ self or:[ b =~ self or:[ a + (2 * eps) =~ self or:[ a - (2 * eps) =~ self or:[ b + (2 * eps) =~ self or:[ b - (2 * eps) =~ self ]]]]] )
		ifTrue:[ ^ true]
		ifFalse:[
			mi := a min: b. 
			ma := a max: b. 
	( (self + (2 * eps) greaterOrDifferentThan: mi) and:[ self + (2 * eps) lesserOrDifferentThan: ma ] )
	ifTrue:[ ^ true]
	ifFalse:[ 		
			^  self between: mi and: ma ]] "( ( self - mi ) abs >=~ eps ) and:[ ( ma - self ) abs >=~ eps ]"
]

{ #category : #'*Geometry' }
Number >> notEqualTo: aNumber [
   ^ (self =~ aNumber) not
]

{ #category : #'*Geometry' }
Number >> signFuz [
	"Answer 1 if the receiver is greater than 0, -1 if less than 0, else 0."

	self >~ 0 ifTrue: [ ^  1 ].
	self <~ 0 ifTrue: [ ^ -1 ].
	^ 0
]
