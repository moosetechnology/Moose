Extension { #name : #PPXmlElement }

{ #category : #'*petitxpath-extensions' }
PPXmlElement >> contentDate [ 
	^self contentText asDate
]

{ #category : #'*petitxpath-extensions' }
PPXmlElement >> contentDateAndTime [ 
	^self contentText asTimeStamp 
]

{ #category : #'*petitxpath-extensions' }
PPXmlElement >> contentNumber [ 
	^self contentText asNumber
]

{ #category : #'*petitxpath-extensions' }
PPXmlElement >> contentText [ 
	^ self firstChild 
		ifNotNil: [ :child | child data ]
]
