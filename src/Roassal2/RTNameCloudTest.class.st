Class {
	#name : #RTNameCloudTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-NameCloud'
}

{ #category : #tests }
RTNameCloudTest >> testBasic [
	| b |
	b := RTNameCloud new.
	b addString: 'open

		| v shape |
		v := RTView new.
		shape := RTLabel new height: [ :assoc | assoc value ]; text: #key.
		v addAll: (shape elementsOn: table associations).
		RTFlowLayout on: v elements.
		v open'.
	b build.
	self assert: b view numberOfElements > 0.
]
