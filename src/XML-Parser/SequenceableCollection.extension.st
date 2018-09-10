Extension { #name : #SequenceableCollection }

{ #category : #'*XML-Parser' }
SequenceableCollection >> includesXMLName: aName [
	"optimized with #to:do:"
	1 to: self size do: [:i |
		(aName isXMLQualifiedOrLocalName: (self at: i))
			ifTrue: [^ true]].
	^ false.
]

{ #category : #'*XML-Parser' }
SequenceableCollection >> xmlLastOrNil [
	"for speed to avoid at:ifAbsent: closure"
	| lastOrNilOffset |

	(lastOrNilOffset := self size) > 0
		ifTrue: [^ self at: lastOrNilOffset]
		ifFalse: [^ nil]
]
