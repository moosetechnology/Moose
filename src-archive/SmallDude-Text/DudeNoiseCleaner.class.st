Class {
	#name : #DudeNoiseCleaner,
	#superclass : #DudeCleaningDecorator,
	#category : #'SmallDude-Text'
}

{ #category : #'instance creation' }
DudeNoiseCleaner class >> new [ 
	"Answer a newly created and initialized instance." 
	 
	^super new initialize
]

{ #category : #private }
DudeNoiseCleaner >> getNoise [ 
	 
	^#('break;' 'else' '{' '}')
]

{ #category : #actions }
DudeNoiseCleaner >> specificClean: text [ 
	 
	| noises crtLine crtNoise | 
	noises := self getNoise. 
	1 
		to: text size 
		do: 
			[:lineNo |  
			crtLine := text at: lineNo. 
			1 
				to: noises size 
				do: 
					[:noiseNo |  
					crtNoise := noises at: noiseNo. 
					crtLine := crtLine copyReplaceAll: crtNoise with: ''. 
					text at: lineNo put: crtLine]]. 
	^text
]
