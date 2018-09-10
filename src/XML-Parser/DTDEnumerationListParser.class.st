"
This is a parser of lists in the form of ""(one|two|...)"".  It assumes there is no whitespace around the ""|"" separated list values.
"
Class {
	#name : #DTDEnumerationListParser,
	#superclass : #Object,
	#instVars : [
		'listString'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDEnumerationListParser class >> on: aString [
	^ self new on: aString
]

{ #category : #private }
DTDEnumerationListParser >> errorDuplicateListValue: aValue [
	XMLValidationException
		formatSignal: 'Duplicate value "{1}" in list'
		with: aValue
]

{ #category : #private }
DTDEnumerationListParser >> listEndOffset [
	^ 1 "')' size"
]

{ #category : #private }
DTDEnumerationListParser >> listStartOffset [
	^ 1 "'(' size"
]

{ #category : #initialization }
DTDEnumerationListParser >> on: aString [
	listString := aString
]

{ #category : #parsing }
DTDEnumerationListParser >> parse [
	"the tokenizer removes all spaces from lists"
	| listStartIndex listEndIndex totalListValues listValues nextListValuesIndex nextValueStartIndex |

	listStartIndex := 1 + self listStartOffset.
	listEndIndex := listString size - self listEndOffset.
	"count the values to preallocate an Array"
	totalListValues := 1.
	listStartIndex to: listEndIndex do: [:i |
		(listString at: i) == $|
			ifTrue: [totalListValues := totalListValues + 1]].

	listValues := Array new: totalListValues.
	nextListValuesIndex := 1.
	nextValueStartIndex := listStartIndex.
	listStartIndex to: listEndIndex do: [:i | 
		(listString at: i) == $|
			ifTrue: [
				listValues
					at: nextListValuesIndex
					put:
						(listString
							copyFrom: nextValueStartIndex
							to: i - 1).
				nextListValuesIndex := nextListValuesIndex + 1.
				nextValueStartIndex := i + 1]].
	listValues
		at: nextListValuesIndex
		put:
			(listString
				copyFrom: nextValueStartIndex
				to: listEndIndex).

	^ listValues.
]
