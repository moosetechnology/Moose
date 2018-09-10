Class {
	#name : #RGByteLayout,
	#superclass : #RGBitsLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGByteLayout >> isByteLayout [

	^ true
]

{ #category : #accessing }
RGByteLayout >> layoutName [

	^ #ByteLayout
]
