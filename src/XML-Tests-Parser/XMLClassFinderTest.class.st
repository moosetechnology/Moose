Class {
	#name : #XMLClassFinderTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Utils'
}

{ #category : #accessing }
XMLClassFinderTest >> absentClassName [
	^ (self presentClassName asString, 'ShouldNotBePresent') asString
]

{ #category : #accessing }
XMLClassFinderTest >> classFinder [
	^ XMLClassFinder
]

{ #category : #accessing }
XMLClassFinderTest >> presentClass [
	^ self class
]

{ #category : #accessing }
XMLClassFinderTest >> presentClassName [
	^ self class name asSymbol
]

{ #category : #tests }
XMLClassFinderTest >> testClassNamed [
	self assert:
		(self classFinder classNamed: self presentClassName) ==
			self presentClass.
	self assert: (self classFinder classNamed: self absentClassName) isNil.
]

{ #category : #tests }
XMLClassFinderTest >> testClassNamedIfAbsent [
	self assert:
		(self classFinder
			classNamed: self presentClassName
			ifAbsent: [self fail]) == self presentClass.
	self assert:
		(self classFinder
			classNamed: self absentClassName
			ifAbsent: [#absent]) = #absent.
]

{ #category : #tests }
XMLClassFinderTest >> testClassNamedIfPresent [
	self assert:
		(self classFinder
			classNamed: self presentClassName
			ifPresent: [:presentClass | #present -> presentClass]) =
				(#present -> self presentClass).
	"ensure cull: is used"
	self assert:
		(self classFinder
			classNamed: self presentClassName
			ifPresent: [#present]) = #present.

	self assert:
		(self classFinder
			classNamed: self absentClassName
			ifPresent: [self fail]) isNil.
]

{ #category : #tests }
XMLClassFinderTest >> testClassNamedIfPresentIfAbsent [
	self assert:
		(self classFinder
			classNamed: self presentClassName
			ifPresent: [:presentClass | #present -> presentClass]
			ifAbsent: [self fail]) =
				(#present -> self presentClass).
	"ensure cull: is used"
	self assert:
		(self classFinder
			classNamed: self presentClassName
			ifPresent: [#present]
			ifAbsent: [self fail]) = #present.

	self assert:
		(self classFinder
			classNamed: self absentClassName
			ifPresent: [self fail]
			ifAbsent: [#absent]) = #absent.
]

{ #category : #tests }
XMLClassFinderTest >> testHasClassNamed [
	self
		assert: (self classFinder hasClassNamed: self presentClassName);
		deny: (self classFinder hasClassNamed: self absentClassName)
]
