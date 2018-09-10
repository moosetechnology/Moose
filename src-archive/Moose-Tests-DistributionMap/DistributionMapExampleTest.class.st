Class {
	#name : #DistributionMapExampleTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-DistributionMap'
}

{ #category : #history }
DistributionMapExampleTest class >> lastStoredRun [
	^ ((Dictionary new) add: (#errors->((Set new))); add: (#passed->((Set new) add: #testSample; yourself)); add: (#failures->((Set new))); add: (#timeStamp->(DateAndTime basicNew instVarAt: 1 put: 623; instVarAt: 2 put: (Duration seconds: 28800 nanoSeconds: 0); instVarAt: 3 put: 2456089; instVarAt: 4 put: 919000001; yourself)); yourself)
]

{ #category : #tests }
DistributionMapExampleTest >> testSample [
	
	| viewRenderer |
	viewRenderer := (DistributionMapExample new properties: DistributionMapExample sampleProperties;
				propertiesMap: DistributionMapExample sampleMap;
				propertyBlock: DistributionMapExample sampleBlock;
				elements: DistributionMapExample sampleOrderedElements;
				render: Collection withAllSubclasses).
				
	self assert: (viewRenderer class == RTMondrian).
	"self shouldnt: [ viewRenderer getRenderedForm ] raise: Error."
	self shouldnt: [ viewRenderer open delete ] raise: Error.
]
