Class {
	#name : #RGWordLayout,
	#superclass : #RGBitsLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGWordLayout >> isWordLayout [

	^ true
]

{ #category : #accessing }
RGWordLayout >> layoutName [

	^ #WordLayout
]
