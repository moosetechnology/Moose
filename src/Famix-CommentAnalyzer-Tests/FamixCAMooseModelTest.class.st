Class {
	#name : #FamixCAMooseModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'method'
	],
	#category : #'Famix-CommentAnalyzer-Tests'
}

{ #category : #running }
FamixCAMooseModelTest >> mockCommentObjects [
	^ #('// Inside emvG_szDataTag buffer in temporal situation
  // Length the request data into emvG_szDataTag buffer in temporal situation' '//memset ( ( char * ) szBuffSndRAD, 0x00, MAX_BUFFER_SND_LEN );
//      ( char ) uiLenSndRAD = sprintf( (char *) szBuffSndRAD' '// Read actualized data' '// Task switch' '//! Get the PAN form Track2 Data (skip the first char that is the start flag of the track)')
		collect: [ :content | FamixTest1Comment content: content ]
]

{ #category : #running }
FamixCAMooseModelTest >> setUp [
	super setUp.
	model := FamixTest1Model sourceLanguage: FamixTest1SourceLanguage new.
	FamixTest1Class named: 'aClass' model: model.
	(method := FamixTest1Method named: 'aMethod' model: model)
		cyclomaticComplexity: 15;
		numberOfLinesOfCode: 100;
		sourceAnchor:
			(FamixTest1IndexedFileAnchor
				fileName: 'toto'
				startPos: 1
				endPos: 1
				model: model).
	model allClasses first addMethod: method.
	self mockCommentObjects
		do: [ :comment | 
			comment
				sourceAnchor:
					(FamixTest1IndexedFileAnchor
						fileName: 'toto'
						startPos: 1
						endPos: 1
						model: model);
				mooseModel: model.
			method addComment: comment ].
	model detectCommentedCode
]

{ #category : #tests }
FamixCAMooseModelTest >> testCleanedSCRBehavioral [
	"test SCR without cleaning"

	self assert: method sourceCommentRateWithCleaning equals: 2 / 5
]

{ #category : #tests }
FamixCAMooseModelTest >> testCommentedCode [
	self assert: (method comments select: #isCode) size equals: 1
]

{ #category : #tests }
FamixCAMooseModelTest >> testComputedSCRContainer [
	"test with default values for containers"

	self assert: model allClasses first sourceCommentRateWithCleaning equals: 0.4.
	self assert: model allClasses first sourceCommentRateWithoutCleaning equals: 7.0
]

{ #category : #tests }
FamixCAMooseModelTest >> testDefaultSCRContainer [
	"test with default values for containers"

	self assert: FamixTest1Class new sourceCommentRateWithoutCleaning equals: 1.
	self assert: FamixTest1Class new sourceCommentRateWithCleaning equals: 1
]

{ #category : #tests }
FamixCAMooseModelTest >> testNumberOfUsefulComments [
	self assert: method usefulComments size equals: 3
]

{ #category : #tests }
FamixCAMooseModelTest >> testRawSCRBehavioral [
	"test SCR without cleaning"

	self assert: method sourceCommentRateWithoutCleaning equals: 7 / 10
]
