Class {
	#name : #DudeMooseSmalltalkTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'SmallDude-Tests-Core'
}

{ #category : #setUp }
DudeMooseSmalltalkTest >> setUp [
	| detector importer | 
	model := MooseModel new.
	importer := MoosePharoImporterTask new
			model: model.
	importer addClass: DudeAClass.
	importer addClass: DudeAnotherClass.
	importer run.
	detector := DudeDetector
		new: DudeTextFiles "how are we looking at entities? - defines the level of parsing / cleaning - see SmallDudeEntitySpecies package for other kinds of parsing"
		from: model allClasses entities "what are we looking at?"
		withStrategy: [:str1 :str2 | str1 size > 0 and: [str1 = str2]] "the string compare strategy"
		andObserver: DudeObserver default "just in case you would like to see the progress...." 
		inModel: model.
	detector getMultiplicationsWith1032	"find multiplications"
]

{ #category : #testing }
DudeMooseSmalltalkTest >> testDuplication [
	self assert: model allMultiplications size equals: 2
]

{ #category : #testing }
DudeMooseSmalltalkTest >> testMSEImportExport [
	| loadedModel |
	loadedModel := MooseModel new importFromMSEStream: model asMSEString readStream.
	self assert: model allDuplications size equals: 3.
	self assert: loadedModel allDuplications size equals: 3
]

{ #category : #testing }
DudeMooseSmalltalkTest >> testModel [
	self
		assert: (model allClasses entityNamed: #Smalltalk::DudeAnotherClass asSymbol) sourceText
		equals:
			'Smalltalk::DudeAnotherClass


methodB
	| a b c |
	a := 0.
	b := 1.
	c := 2.
	a = 0 ifTrue: [
		b = 1 ifTrue: [
			c = 2 ifTrue: [
				Transcript show: ''Daaaaa!''
			]
		]
	].
	^a + b + c'
]

{ #category : #testing }
DudeMooseSmalltalkTest >> testViewConstellation [

	self shouldnt: [ model allMultiplications viewConstellation delete ] raise: Error
]
