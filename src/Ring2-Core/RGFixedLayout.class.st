Class {
	#name : #RGFixedLayout,
	#superclass : #RGPointerLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGFixedLayout >> isFixedLayout [

	^ true
]

{ #category : #accessing }
RGFixedLayout >> layoutName [

	^ #FixedLayout
]
