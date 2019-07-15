Extension { #name : #String }

{ #category : #'*grease-core' }
String >> excerpt: aString [
	"Answer an excerpt of the receiver that matches the first occurence of aString. If aString isn't found, nil is answered."
	
	^ self excerpt: aString radius: 100
]

{ #category : #'*grease-core' }
String >> excerpt: aString radius: anInteger [
	"Answer an excerpt of the receiver that matches the first occurence of aString. The radius anInteger expands the excerpt on each side of the first occurrence by the number of characters defined in radius. If aString isn't found, nil is answered."
	
	^ self excerpt: aString radius: anInteger ellipsis: '...'
]

{ #category : #'*grease-core' }
String >> excerpt: aString radius: anInteger ellipsis: anEllipsisString [
	"Answer an excerpt of the receiver that matches the first occurence of aString. The radius anInteger expands the excerpt on each side of the first occurrence by the number of characters defined in radius. If aString isn't found, nil is answered."

	| index start stop |
	(index := self indexOfSubCollection: aString) = 0
		ifTrue: [ ^ nil ].
	start := index - anInteger max: 1.
	stop := index + anInteger + aString size - 1 min: self size.
	^ (start > 1 ifTrue: [ anEllipsisString ] ifFalse: [ '' ]) ,
		(self copyFrom: start to: stop) ,
	  	(stop < self size ifTrue: [ anEllipsisString ] ifFalse: [ '' ])
]

{ #category : #'*grease-core' }
String >> greaseInteger [
	"Convert the receiver to an integer, answer nil if this is not a number."
	| number stream negated char |
	number := nil.
	stream := self readStream.
	negated := stream peek = $-.
	negated ifTrue: [ stream next ].
	[ stream atEnd not and: [ (char := stream next) isDigit ] ] whileTrue: [
		number := (number isNil  ifTrue: [ 0 ]ifFalse: [ 10 * number ])
			+ (char greaseInteger - $0 greaseInteger) ].
	^ (number isNil or: [ negated not ]) 
		ifFalse: [ number negated ]
		ifTrue: [ number ]
]

{ #category : #'*grease-core' }
String >> pluralize [
	^ GRInflector pluralize: self
]

{ #category : #'*grease-core' }
String >> print: anObject on: aStream [
	aStream nextPutAll: self
]

{ #category : #'*grease-core' }
String >> truncate [
	"Truncate the receiver to 30 characters."
	
	^ self truncate: 30
]

{ #category : #'*grease-core' }
String >> truncate: anInteger [
	"Truncate the receiver to anInteger characters."
	
	^ self truncate: anInteger ellipsis: '...'
]

{ #category : #'*grease-core' }
String >> truncate: anInteger ellipsis: aString [
	"Truncate the receiver to anInteger characters and append aString as ellipsis if necessary."

	^ anInteger < self size
		ifTrue: [ (self copyFrom: 1 to: anInteger) , aString ]
		ifFalse: [ self copy ]
]
