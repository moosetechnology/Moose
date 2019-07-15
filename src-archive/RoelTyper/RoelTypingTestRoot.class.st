Class {
	#name : #RoelTypingTestRoot,
	#superclass : #TestCase,
	#instVars : [
		'dummyVariable',
		'for',
		'offsetTest'
	],
	#category : #'RoelTyper-Tests'
}

{ #category : #auxiliary }
RoelTypingTestRoot >> doForSource: src [
	| m |
	m := (self class compiler new
		compile: 'gen ' , src
		in: self class
		notifying: nil
		ifFail: [self error: 'Error during compilation of generated method.'])
		generate.
	^self processMethod: m
]

{ #category : #auxiliary }
RoelTypingTestRoot >> processMethod: aCompiledMethod [
	"Fail by default. Needs to be overridden by subclasses to trigger the base testing backbone."

	self assert: false
]
