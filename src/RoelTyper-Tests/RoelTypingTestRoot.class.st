Class {
	#name : #RoelTypingTestRoot,
	#superclass : #TestCase,
	#instVars : [
		'dummyVariable',
		'for',
		'offsetTest'
	],
	#category : #'RoelTyper-Tests-Tests'
}

{ #category : #auxiliary }
RoelTypingTestRoot >> doForSource: src [
	| m |
	m := (Smalltalk compiler
		source: 'gen ' , src;
		class: self class;
		requestor: nil;
		failBlock: [ self error: 'Error during compilation of generated method.' ];
		parse) generate.
	^ self processMethod: m
]

{ #category : #auxiliary }
RoelTypingTestRoot >> processMethod: aCompiledMethod [
	"Fail by default. Needs to be overridden by subclasses to trigger the base testing backbone."

	self assert: false
]
