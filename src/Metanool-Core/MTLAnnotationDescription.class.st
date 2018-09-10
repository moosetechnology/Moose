Class {
	#name : #MTLAnnotationDescription,
	#superclass : #FM3PropertyDescription,
	#category : #'Metanool-Core'
}

{ #category : #meta }
MTLAnnotationDescription class >> annotation [
	<MSEClass: #Annotation super: #FM3Element>
	<package: #FM3>

]

{ #category : #'accessing-meta' }
MTLAnnotationDescription >> getRawFrom: element [
	^ element privateState attributeAt: self name ifAbsent: [nil]
]

{ #category : #'accessing-meta' }
MTLAnnotationDescription >> setOn: element rawValue: value [
	element privateState attributeAt: self name put: value
]

{ #category : #'accessing-meta' }
MTLAnnotationDescription >> setOn: element values: array [
	"This method is used by the repository"

	| parameter |

	"this is commented because it does not match"
	"self implementingSelector isNil
		ifTrue: [ ^element at: self put: array ]."
	parameter := self isMultivalued 
		ifTrue: [ array ]
		ifFalse: [ array isEmpty 
			ifTrue: [ nil ]
			ifFalse: [ 
				array size > 1 ifTrue: [ self error ].
				array first ]].
	element mmSetProperty: self to: parameter.
]
