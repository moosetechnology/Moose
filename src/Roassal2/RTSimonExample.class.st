Class {
	#name : #RTSimonExample,
	#superclass : #RTObject,
	#category : #'Roassal2-Builder-Simon'
}

{ #category : #basic }
RTSimonExample >> basic01 [
	<gtExample>
	"
	self new basic01
	"
	| builder |
	builder := RTSimon new.
	builder models: (1 to: 20).
	^ builder
]

{ #category : #basic }
RTSimonExample >> basic02 [
	<gtExample>
	"
	self new basic02
	"
	| builder |
	builder := RTSimon new.
	builder shape current externalRadius: [ :obj | (obj * 3) + 80].
	builder models: (1 to: 20).
	^ builder
]

{ #category : #basic }
RTSimonExample >> basic03 [
	<gtExample>
	"
	self new basic03
	"
	| builder |
	builder := RTSimon new.
	builder shape current 
						innerRadius: [ :r | 200 atRandom ];
						externalRadius: [ :obj | 200 + 40 atRandom ];
						outerAngle: [ :o | 360 atRandom ] innerAngle: [ :o | 50 atRandom ];
						color: [ :o | ((Array with: Color red with: Color blue with: Color white) atRandom alpha: 0.1)].
	builder models: (1 to: 10).
	^ builder
]

{ #category : #basic }
RTSimonExample >> basic03Animated [
	<gtExample>
	"
	self new basic03Animated
	"
	| builder timer |
	timer := TRVITimer new cycleLength: 10.
	
	builder := RTSimon new.
	builder shape current 
						innerRadius: [ :r | 200 atRandom ];
						externalRadius: [ :obj | 200 + 40 atRandom ];
						outerAngle: [ :e  | 
							| a b |
							a := 300 atRandom.
							b := 200 atRandom.
							TRVIAnimatedValue new
													evaluator: [ :t | a interpolateTo: (a + b) at: t ];
													timer: timer;
													yourself. ]
							innerAngle: [ :e | 50 atRandom ];
						color: [ :o | ((Array with: Color red with: Color blue with: Color white) atRandom alpha: 0.1)].
	builder models: (1 to: 10).
	timer start.
	builder view addAnimation: (RTResetAllShape new trCanvas: builder view canvas). 
	^ builder
]

{ #category : #'software visualization' }
RTSimonExample >> softviz01 [
	<gtExample>
	"
	self new softviz01

	LOC, NOM, NOV, NOS
	"
	| b | 
	b := RTSimon new.
	b shape current
				outerAngle: [ :e | e model numberOfVariables * 25 ] 
					innerAngle: [ :e | e model numberOfMethods / 1 ];
				innerRadius: [ :cls | cls withAllSuperclasses size * 10 ];
				thickness: [ :cls | cls numberOfMethods * 2 ];
				color: (Color red alpha: 0.2).
	b models: RTObject withAllSubclasses.
	^ b
]
