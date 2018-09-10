Extension { #name : #StandardOrderedDictionary }

{ #category : #'*XML-Writer-Core' }
StandardOrderedDictionary >> writeAttributesOn: aWriter [
	self keysDo: [:attributeName |
		aWriter
			writeAttributeName: attributeName
			value: (self at: attributeName ifAbsent: '')]
]

{ #category : #'*XML-Writer-Core' }
StandardOrderedDictionary >> writeCanonicalAttributesOn: aWriter [
	| sortedAttributeNames |

	(sortedAttributeNames := self keys) sort: [:a :b | | prefixOfA prefixOfB |
		prefixOfA := a xmlWriterPrefixBeforeLocalName.
		prefixOfB := b xmlWriterPrefixBeforeLocalName.
		prefixOfA = prefixOfB
			ifTrue: [
				"if the prefixes are the same, no need to lookup the namespace"
				(a xmlWriterLocalNameAfterPrefix: prefixOfA)
					<= (b xmlWriterLocalNameAfterPrefix: prefixOfB)]
			ifFalse: [| uriOfA uriOfB |
				"the namespace URI is the primary key and
				the local name is the secondary key"
				uriOfA :=
					aWriter resolveActiveTagWriterAttributePrefix: prefixOfA.
				uriOfB :=
					aWriter resolveActiveTagWriterAttributePrefix: prefixOfB.
				uriOfA < uriOfB
					or: [
						uriOfA = uriOfB
							and: [
								(a xmlWriterLocalNameAfterPrefix: prefixOfA)
									<= (b xmlWriterLocalNameAfterPrefix: prefixOfB)]]]].

	"use to:do: for fast writing"
	1 to: sortedAttributeNames size do: [:i | | attributeName |
		attributeName := sortedAttributeNames at: i.
		aWriter
			writeAttributeName: attributeName
			value: (self at: attributeName)].
]
