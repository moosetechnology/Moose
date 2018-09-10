"
This class contains a set of benchmarks.
It is useful for example, to monitor the evolution or see the impact of the Virtual machine
"
Class {
	#name : #RTBenchmarks,
	#superclass : #RTObject,
	#category : #'Roassal2-Utility'
}

{ #category : #benchmarking }
RTBenchmarks >> bench01 [
	"Exercizing elementsFromModel"

	"
	self new bench01
	"
	
	| v es |
	v := RTView new.
	es := RTBox new elementsOn: (1 to: 20000).
	es @ (RTHighlightable new highlight: [:obj | Array with: obj - 1 with: obj + 1 ]).
	v addAll: es.
	RTGridLayout new gapSize: 0; on: es.
	^ [v elementsFromModels: (1 to: 20000). v elementsFromModels: (1 to: 20000). v elementsFromModels: (1 to: 20000)] timeToRun

]

{ #category : #benchmarking }
RTBenchmarks >> bench02 [
	"Exercizing Mondrian"
	"
	self new bench02
	" 

	^ [ | b |
		b := RTMondrian new.
		b nodes: (1 to: 800) forEach: [ :v |
			b nodes: (1 to: v )].
		b build ] timeToRun
]

{ #category : #benchmarking }
RTBenchmarks >> bench03 [
	"Exercizing force layout"
	"
	self new bench03
	" 

	^ [ | b |
		b := RTMondrian new.
		b nodes: (1 to: 800).
		b edges connectFrom: [ :v | v // 2 ].
		b layout force.
		b build ] timeToRun
]

{ #category : #benchmarking }
RTBenchmarks >> bench04 [
	"Exercizing force layout"
	"
	self new bench04
	" 

	^ [ | b ds |
		b := RTGrapher new.
		ds := RTData new.
		ds points: (1 to: 20000).
		ds y: #yourself.
		b add: ds.
		b build ] timeToRun
]

{ #category : #benchmarking }
RTBenchmarks >> bench05 [
	"Simple benchamark for RTUMLClassBuilder"
	"
	self new bench05
	" 

	^ [ | b |
	b := RTUMLClassBuilder new
		instanceVariables: #instVarNames;
		methodselector: #selector;
		methodsNames: #rtmethods;
		attributeselector: #yourself.
	b attributeShape color: Color black.
	b methodShape color: Color black.
	b classNameShape color: Color black.
	b lineShape color: Color black.
	b boxShape borderColor: Color black.
	b addObjects: (TRAbstractArrowHeadShape withAllSubclasses ).
	b layout tree.
	b build.
	b view ] bench
]
