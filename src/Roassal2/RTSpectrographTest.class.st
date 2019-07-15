Class {
	#name : #RTSpectrographTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Spectrograph'
}

{ #category : #'method timestamp' }
RTSpectrographTest >> foo [
	"timeStamp : 'AlexandreBergel 5/11/2014 00:29'"
	^ 'hello world'
]

{ #category : #running }
RTSpectrographTest >> setUp [
	super setUp.
	b := RTSpectrograph new.
]

{ #category : #tests }
RTSpectrographTest >> testBasic [

	b objects: #(1 2 3).
	b lineBlock: [ :v | (1 to: v) ].
	b highlight: [ :v1 :v2 | v2 odd ].
	b build.
	
	self assert: b view numberOfElements equals: 1 + 2 + 3
]

{ #category : #tests }
RTSpectrographTest >> testBasicWithNoHighlight [

	b objects: #(1 2 3).
	b lineBlock: [ :v | (1 to: v) ].
	b build.
	
	self assert: b view numberOfElements equals: 1 + 2 + 3
]

{ #category : #'method timestamp' }
RTSpectrographTest >> testGotMethodOnDay [

	self assert: (RTShape gotMethodOnDay: 0)
]

{ #category : #tests }
RTSpectrographTest >> testHighlight [

	b objects: (Array with: 10).
	b lineBlock: [ :v | 1 to: v ].
	b highlight: [ :root :v | v = 2 ].
	b build.
	self assert: (b view elementFromModel: #(10 1)) trachelShape color ~= Color red.
	self assert: (b view elementFromModel: #(10 2)) trachelShape color = Color red.
	

]
