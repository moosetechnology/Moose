Class {
	#name : #FMInferencerTest,
	#superclass : #TestCase,
	#instVars : [
		'tower'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMInferencerTest >> setUp [
	super setUp.
	tower := FMTower new.
]

{ #category : #running }
FMInferencerTest >> testClient [
	| tool client |
	tool := FMInferencer new.
	tool client: (client := FMDebugClient new).
	tool client should = client
]

{ #category : #running }
FMInferencerTest >> testInferencer [
	| trace |
	trace := self traceInferenceOfMetamodel: FMHeinekenExample modelMSE.
	trace contents isEmpty should beFalse	"todo more!!!"
]

{ #category : #running }
FMInferencerTest >> testMultivaluedProperty [
	| trace |
	trace := self traceInferenceOfMetamodel:
			'(
		(EG.Element (attr 1))
		(EG.Element (attr 1 2))
		(EG.Element (attr 1 2 3))
	)'.
	trace contents isEmpty should beFalse	"TODO, better test"
]

{ #category : #running }
FMInferencerTest >> traceInferenceOfMetamodel: mseString [ 
	| tool parser trace |
	tool := FMInferencer new.
	parser := FMMSEParser new.
	parser fromString: mseString.
	parser client: tool.
	parser run.
	trace := FMDebugClient new.
	tool client: trace.
	tool run.
	^ trace
]
