Extension { #name : #MooseAbstractGroup }

{ #category : #'*SmallDude-Moose-private' }
MooseAbstractGroup >> computeDuplication [ 
	 
	| detector chains | 
	detector := DudeDetector 
		new: DudeJavaFiles 
		from: self entities 
		andObserver: DudeObserver defaultObserverForTextPreprocessing 
		inModel: self mooseModel. 
	detector observer: DudeObserver defaultObserverForDupDetecting. 
	chains := detector getMultiplicationsWith1032DisplayingProgress
]
