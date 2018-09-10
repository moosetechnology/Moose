Class {
	#name : #REPReporter,
	#superclass : #Object,
	#instVars : [
		'stream',
		'spec'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #'instance creation' }
REPReporter class >> runOn: spec [
	^ self new 
		spec: spec;
		run;
		yourself
]

{ #category : #private }
REPReporter >> convert: aString [
	^ (aString asString 
		copyReplaceAll: (String with: Character cr with: Character lf) with: (String with: Character lf))
		copyReplaceAll: (String with: Character cr) with: (String with: Character lf)
]

{ #category : #private }
REPReporter >> encode: aString [
	| result |
	result := aString asString.
	result := result copyReplaceAll: '&' with: '&amp;'. 
	result := result copyReplaceAll: '£' with: 'POUND'.
	result := result copyReplaceAll: '"' with: '&quot;'. 
	result := result copyReplaceAll: '<' with: '&lt;'.
	result := result copyReplaceAll: 'Ä' with: 'AE'.
	result := result copyReplaceAll: 'Ï' with: 'I'.
	result := result copyReplaceAll: 'Ü' with: 'UE'.
	result := result copyReplaceAll: 'Ö' with: 'OE'.
	result := result copyReplaceAll: 'ï' with: 'i'.
	result := result copyReplaceAll: 'ö' with: 'oe'.
	result := result copyReplaceAll: 'ä' with: 'ae'.
	result := result copyReplaceAll: 'ü' with: 'ue'.
	result := result copyReplaceAll: 'é' with: 'e'.
	result := result copyReplaceAll: 'è' with: 'e'.
	result := result copyReplaceAll: 'à' with: 'a'.
	result := result copyReplaceAll: 'â' with: 'a'.
	^ result
]

{ #category : #private }
REPReporter >> end [
	stream tab; nextPutAll: '<system-out><![CDATA[]]></system-out>'; lf.
	stream tab; nextPutAll: '<system-err><![CDATA[]]></system-err>'; lf.
	stream nextPutAll: '</testsuite>'.
	stream close
]

{ #category : #private }
REPReporter >> printConcern: aConcern [
	self printConcernStart: aConcern.
	aConcern status isFailureStatus ifTrue: [
		stream 
			tab; tab;
			nextPutAll: '<error type="TestFailure" message="';
					nextPutAll: (self encode: aConcern explanation);
					nextPutAll: (self encode: ' (');
					nextPutAll: (self encode: aConcern stakeholder);
					nextPutAll: (self encode: ')');
				nextPutAll: '">';
				lf;
				nextPutAll: (self encode: aConcern stringResult);
			nextPutAll: '</error>';
			lf
		].
	aConcern status isNeutralStatus ifTrue: [
		stream
			tab; tab;
			nextPutAll: '<system-out>';
				nextPutAll: (self encode: aConcern stringResult);
			nextPutAll: '</system-out>';
			lf
		].
	self printConcernEnd: aConcern 
]

{ #category : #private }
REPReporter >> printConcernEnd: aConcern [
	stream
		tab;
		nextPutAll: '</testcase>';
		lf
]

{ #category : #private }
REPReporter >> printConcernStart: aConcern [
	stream
		tab; 
		nextPutAll: '<testcase '; 
			nextPutAll: 'classname="'; nextPutAll: (self encode: aConcern label);  
			nextPutAll: '" name="('; nextPutAll: (self encode: aConcern label); 
			nextPutAll: ')" time="'; print: 0.1; nextPutAll: '">'; 
		lf
]

{ #category : #running }
REPReporter >> run [
	self start.
	spec root allLeafConcerns do: [:each |
		self printConcern: each
		].
	self end
]

{ #category : #accessing }
REPReporter >> spec: aSpec [
	spec := aSpec
]

{ #category : #private }
REPReporter >> start [
	| leafs |
	stream := StandardFileStream forceNewFileNamed: spec root label, '.xml'.
	stream ascii.
	stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; lf.
	leafs := spec root allLeafConcerns.
	stream 
		nextPutAll: '<testsuite name="'; 
			nextPutAll: (self encode: spec root label); 
			nextPutAll: '" tests="'; print: leafs size; nextPutAll: '"';
			nextPutAll: ' failures="'; print: (leafs count: [:each | each status isFailureStatus]); 
			nextPutAll:'" errors="0'; 
			nextPutAll: '" time="';print: 0; 
		nextPutAll: '">';
		lf
]
