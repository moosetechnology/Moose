Class {
	#name : #RGBitsLayout,
	#superclass : #RGObjectLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGBitsLayout >> isBitsLayout [

	^ true
]

{ #category : #'testing types' }
RGBitsLayout >> isVariableLayout [

	^ true
]

{ #category : #accessing }
RGBitsLayout >> layoutName [

	^ #BitsLayout
]
