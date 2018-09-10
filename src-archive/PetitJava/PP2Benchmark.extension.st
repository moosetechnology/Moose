Extension { #name : #PP2Benchmark }

{ #category : #'*PetitJava' }
PP2Benchmark >> benchmarkJavaParser [
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitJava' }
PP2Benchmark >> benchmarkJavaParserNoOpt [
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitJava' }
PP2Benchmark >> benchmarkJavaSyntax [
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitJava' }
PP2Benchmark >> benchmarkJavaSyntaxNoOpt [
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitJava' }
PP2Benchmark >> setupJavaParser [
	self setup: PPJavaParser sources: 'java'.
	self parser name: 'Java Parser'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	
]

{ #category : #'*PetitJava' }
PP2Benchmark >> setupJavaParserNoOpt [
	self setup: PPJavaParser sources: 'java'.
	self parser name: 'Java Parser (NoOpt)'.

	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.

]

{ #category : #'*PetitJava' }
PP2Benchmark >> setupJavaSyntax [
	self setup: PPJavaSyntax sources: 'java'.
	self parser name: 'Java Syntax'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	
]

{ #category : #'*PetitJava' }
PP2Benchmark >> setupJavaSyntaxNoOpt [
	self setup: PPJavaSyntax sources: 'java'.
	self parser name: 'Java Syntax (NoOpt)'.

	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.

]
