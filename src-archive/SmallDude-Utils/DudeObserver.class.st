Class {
	#name : #DudeObserver,
	#superclass : #Object,
	#instVars : [
		'currentStep',
		'stepCount',
		'triggerCount',
		'lastTriggerTime',
		'startTime',
		'startTrigger',
		'incrTrigger',
		'endTrigger'
	],
	#category : #'SmallDude-Utils'
}

{ #category : #default }
DudeObserver class >> default [ 
	 
	^(self 
		newWithTriggerOnStart: [:observer | ] 
		onEnd: [:observer | ] 
		onIncrement: [:observer | ]) 
		triggerCount: 1; 
		yourself
]

{ #category : #default }
DudeObserver class >> defaultObserverForDupDetecting [ 
	 
	^(self 
		newWithTriggerOnStart: 
			[:observer |  
			Transcript 
				cr; 
				cr; 
				cr; 
				show: 
						'SmallDude: ' , (Time now printString) , 
									' detecting duplication chains...'; 
				cr] 
		onEnd: 
			[:observer |  
			Transcript 
				show: 
						'SmallDude: worked for ' , observer secondsSinceStart printString , 
									' seconds'; 
				cr] 
		onIncrement: 
			[:observer |  
			Transcript 
				show: 
						observer progress printString , ' out of ' , observer stepCount printString 
								, '; time since last report: ' 
								, observer secondsSinceLastTrigger printString , ' seconds'; 
				cr]) 
		triggerCount: 1000; 
		yourself
]

{ #category : #default }
DudeObserver class >> defaultObserverForTextPreprocessing [ 
	 
	^(self 
		newWithTriggerOnStart: 
			[:observer |  
			Transcript 
				cr; 
				cr; 
				cr; 
				show: 
						'SmallDude: ' , Time now printString, 
									' preProcessing text...'; 
				cr] 
		onEnd: 
			[:observer |  
			Transcript 
				show: 
						'SmallDude: worked for ' , observer secondsSinceStart printString , 
									' seconds'; 
				cr] 
		onIncrement: 
			[:observer |  
			Transcript 
				show: 
						observer progress printString , ' out of ' , observer stepCount printString 
								, '; time since last report: ' 
								, observer secondsSinceLastTrigger printString , ' seconds'; 
				cr]) 
		triggerCount: 100; 
		yourself
]

{ #category : #'instance creation' }
DudeObserver class >> newWithTriggerOnStart: startBlock onEnd: endBlock onIncrement: incrBlock [ 
	 
	^(super new) 
		triggerOnStart: startBlock onEnd: endBlock onIncrement: incrBlock; 
		stepCount: 0; 
		triggerCount: 1; 
		yourself
]

{ #category : #observation }
DudeObserver >> increment [ 
	 
	currentStep := currentStep + 1. 
	currentStep - (triggerCount * (currentStep // triggerCount)) = 0 
		ifTrue: 
			[incrTrigger value: self. 
			lastTriggerTime := Time secondClock]
]

{ #category : #accessing }
DudeObserver >> progress [ 
	 
	^currentStep
]

{ #category : #'initialize-release' }
DudeObserver >> reset [ 
	 
	currentStep := 0. 
	lastTriggerTime := nil. 
	startTime := nil
]

{ #category : #accessing }
DudeObserver >> secondsSinceLastTrigger [ 
	 
	lastTriggerTime isNil ifTrue: [^0]. 
	^Time secondClock - lastTriggerTime
]

{ #category : #accessing }
DudeObserver >> secondsSinceStart [ 
	 
	startTime isNil ifTrue: [^0]. 
	^Time secondClock - startTime
]

{ #category : #observation }
DudeObserver >> start [ 
	 
	self reset. 
	startTime := Time secondClock. 
	startTrigger value: self. 
	lastTriggerTime := Time secondClock
]

{ #category : #observation }
DudeObserver >> start: expectedNumberOfSteps [ 
	 
	self reset. 
	self stepCount: expectedNumberOfSteps. 
	startTrigger value: self. 
	lastTriggerTime := Time secondClock
]

{ #category : #accessing }
DudeObserver >> stepCount [ 
	 
	^stepCount
]

{ #category : #'initialize-release' }
DudeObserver >> stepCount: totalStepCount [ 
	 
	stepCount := totalStepCount
]

{ #category : #observation }
DudeObserver >> stop [ 
	 
	endTrigger value: self. 
	lastTriggerTime := Time secondClock
]

{ #category : #'initialize-release' }
DudeObserver >> triggerCount: triggerSteps [ 
	 
	triggerCount := triggerSteps
]

{ #category : #'initialize-release' }
DudeObserver >> triggerOnStart: startBlock onEnd: endBlock onIncrement: incrBlock [ 
	 
	startTrigger := startBlock. 
	endTrigger := endBlock. 
	incrTrigger := incrBlock
]
