Class {
	#name : #DudeCVSAnnotateCleaner,
	#superclass : #DudeCleaningDecorator,
	#instVars : [
		'lineAnnotations'
	],
	#category : #'SmallDude-Text'
}

{ #category : #parsing }
DudeCVSAnnotateCleaner class >> extractText: aString andDoWithAnnotation: aBlockThatUsesTheAnnotation [ 
	 
	| annoEnd anno text | 
	annoEnd := aString indexOfSubCollection: '): ' startingAt: 1. 
	anno := aString sliceTo: annoEnd. 
	text := aString sliceFrom: annoEnd + 3. 
	aBlockThatUsesTheAnnotation value: anno. 
	^text
]

{ #category : #parsing }
DudeCVSAnnotateCleaner class >> parse: aAnnotationString andStoreTo: aSourceCodeLine inModel: aModel [ 
	 
	| spaces authorName | 
	spaces := ' 	'. 
	aAnnotationString size = 33 
		ifTrue: 
			[aSourceCodeLine 
				modifyedVersion: 
					((aAnnotationString sliceTo: 12) trimCharacters: spaces). 
			authorName := (aAnnotationString sliceFrom: 15 to: 22) trimCharacters: 
					spaces. 
			aSourceCodeLine 
				modifyingAuthor: (DudeDeveloper new name: authorName; mooseModel: aModel; yourself). 
			aSourceCodeLine 
				modificationDate: 
					(self 
						parseDate: 
							((aAnnotationString sliceFrom: 24 to: 32) trimCharacters: spaces))]. 
	^aSourceCodeLine
]

{ #category : #private }
DudeCVSAnnotateCleaner class >> parseDate: aDateString [ 
	"aDateString is expected to be in the format: DD-MMM-YY 
		where,  
			if YY>=80 then the year is 19YY 
			if YY<80 then the year is 20YY 
	" 
	 
	| day month year spaces dateStr | 
	spaces := ' 	'. 
	dateStr := aDateString. 
	day := (dateStr sliceTo: (dateStr indexOf: $-) - 1) trimCharacters: spaces. 
	dateStr := dateStr sliceFrom: (dateStr indexOf: $-) + 1. 
	month := (dateStr sliceTo: (dateStr indexOf: $-) - 1) trimCharacters: 
			spaces. 
	year := (dateStr sliceFrom: (dateStr indexOf: $-) + 1) trimCharacters: 
			spaces. 
	day := Number 
		readIntegerFrom: (ReadStream on: day) 
		radix: 10. 
	year := Number 
		readIntegerFrom: (ReadStream on: year) 
		radix: 10. 
	year := year < 80 
		ifTrue: [2000 + year] 
		ifFalse: [1900 + year]. 
	^Date newDay: day month: month year: year
]

{ #category : #'initialize-release' }
DudeCVSAnnotateCleaner >> initialize [ 
	 
	lineAnnotations := nil. 
	^self
]

{ #category : #accessing }
DudeCVSAnnotateCleaner >> lineAnnotations [ 
	 
	^lineAnnotations
]

{ #category : #actions }
DudeCVSAnnotateCleaner >> specificClean: aStringList [ 
	 
	lineAnnotations := OrderedCollection new: aStringList size. 
	^aStringList 
		collect: 
			[:aLine |  
			DudeCVSAnnotateCleaner 
				extractText: aLine 
				andDoWithAnnotation: [:annotation | self storeAnnotation: annotation]]
]

{ #category : #private }
DudeCVSAnnotateCleaner >> storeAnnotation: anno [ 
	 
	lineAnnotations addLast: anno
]

{ #category : #actions }
DudeCVSAnnotateCleaner >> storeCVSInfoTo: aSourceCodeLineList fromModel: aModel [ 
	 
	aSourceCodeLineList 
		doWithIndex: 
			[:scl :index |  
			DudeCVSAnnotateCleaner 
				parse: (lineAnnotations at: index) 
				andStoreTo: scl 
				inModel: aModel]
]
