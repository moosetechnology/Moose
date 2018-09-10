Extension { #name : #PP2SourcesTest }

{ #category : #'*PetitJava' }
PP2SourcesTest >> testJavaSources [
	| s1 s2 |
	[
		PP2Sources reset.
		s1 := PP2Sources current javaSourcesProfiling.
		PP2Sources reset.
		s2 := PP2Sources current javaSourcesProfiling.
		
		self assert: s1 equals: s2.
	] ensure: [
		PP2Sources current javaAllUrl  asFileReference ensureDelete ]
]
