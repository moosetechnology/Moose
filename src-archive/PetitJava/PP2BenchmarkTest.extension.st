Extension { #name : #PP2BenchmarkTest }

{ #category : #'*PetitJava' }
PP2BenchmarkTest >> testJavaParser [
	| input  bench |
	bench := PP2Benchmark new.
	bench setupJavaParser.

	self assert: (bench parser isKindOf: PPJavaParser).
	self assert: (bench parser isOptimized).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
]

{ #category : #'*PetitJava' }
PP2BenchmarkTest >> testJavaParserNoOpt [
	| input  bench |
	bench := PP2Benchmark new.
	bench setupJavaParserNoOpt.

	self assert: (bench parser isKindOf: PPJavaParser).
	self assert: (bench parser isOptimized) not.
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
]

{ #category : #'*PetitJava' }
PP2BenchmarkTest >> testJavaSyntax [
	| input  bench |
	bench := PP2Benchmark new.
	bench setupJavaSyntax.

	self assert: (bench parser isKindOf: PPJavaSyntax).
	self assert: (bench parser isOptimized).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
]

{ #category : #'*PetitJava' }
PP2BenchmarkTest >> testJavaSyntaxNoOpt [
	| input  bench |
	bench := PP2Benchmark new.
	bench setupJavaSyntaxNoOpt.

	self assert: (bench parser isKindOf: PPJavaSyntax).
	self assert: (bench parser isOptimized not).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
]
