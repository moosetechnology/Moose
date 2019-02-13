Class {
	#name : #RTCacheTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Cachetor'
}

{ #category : #tests }
RTCacheTest >> testBasic [

	| v es form |
	v := RTView new.
	es := (RTEllipse new size: 20) elementsOn: (1 to: 20).
	v addAll: es.
	RTHorizontalLineLayout on: es.
	
	self assert: v numberOfElements equals: 20.
	RTCache new cacheElements: es.
	self assert: v numberOfElements equals: 1.
	self assert: v elements anyOne class equals: RTElement.
	self assert: v elements anyOne shape class equals: RTBitmap.
	self assert: v elements anyOne trachelShape form class equals: TRPlatform current formClass.
	
	form :=  v elements anyOne trachelShape form.
	self assert: form extent equals: es extent
]
