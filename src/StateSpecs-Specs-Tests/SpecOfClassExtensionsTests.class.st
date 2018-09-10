Class {
	#name : #SpecOfClassExtensionsTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfClassExtensionsTests >> testObjectsAreNotStateSpecs [

	self deny: Object new isStateSpec 
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingBlockForSpecTitle [
	| result |
	result := [ :blockArg | blockArg > 0 ] stringForSpecTitle.

	self assert: result equals: '[ :blockArg | blockArg > 0 ]'
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingByteArray [
	| result |

	result := #[1 2 3] stringForSpecTitle.
	self assert: result equals: #[1 2 3] printString
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingCompiledMethod [
	| result |

	result := (Point>>#x) stringForSpecTitle.
	self assert: result equals: (Point>>#x) printString
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingEmptyArray [
	| result |

	result := Array new stringForSpecTitle.
	self assert: result equals: '#()'
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingEmptySet [
	| result |

	result := Set new stringForSpecTitle.
	self assert: result equals: 'a Set{}'
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingLiteralArrayForSpecTitle [
	| result |

	result := #(1 2 3) stringForSpecTitle.
	self assert: result = '#(1 2 3)'
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingNonLiteralCollectionForSpecTitle [
	| result |

	result := (Array with: Object new with: Object new) stringForSpecTitle.
	self assert: result equals: 'an Array{an Object. an Object}'
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingObjectForSpecTitle [
	| object result |
	object := Object new.
	
	result := object stringForSpecTitle.
	
	self assert: result = object printString
]

{ #category : #tests }
SpecOfClassExtensionsTests >> testPrintingStringForSpecTitle [
	| result |
.
	result := 'someString' stringForSpecTitle.

	self assert: result = '''someString'''
]
