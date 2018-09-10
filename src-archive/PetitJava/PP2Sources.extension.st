Extension { #name : #PP2Sources }

{ #category : #'*PetitJava' }
PP2Sources >> javaAllUrl [
	^ 'java-src-all.zip'
]

{ #category : #'*PetitJava' }
PP2Sources >> javaFiles [
	^ self files: ((self downloadUI: self javaAllUrl) allFiles) withExtension: 'java'
]

{ #category : #'*PetitJava' }
PP2Sources >> javaSourcesBenchmarking [
	^ self cachedValue: #javaSourcesBenchmarking ifAbsentPut: [ 
		self 
			selectEvenly: 100
			fromFiles: 	self javaFiles
			thatSatisfy: self javaWorkingBlock
 	]

]

{ #category : #'*PetitJava' }
PP2Sources >> javaSourcesProfiling [
	^ self cachedValue: #javaSourcesProfiling ifAbsentPut: [ 
		self 
			selectEvenly: 10
			fromFiles: self javaFiles
			thatSatisfy: self javaWorkingBlock
 	]

]

{ #category : #'*PetitJava' }
PP2Sources >> javaWorkingBlock [
	^ [ :fileReference | 
		[ (PPJavaSyntax parse: fileReference contents) isPetit2Failure not ] 
			valueWithin: 10 asDuration 
			onTimeout: [ false ] 
	]
]
