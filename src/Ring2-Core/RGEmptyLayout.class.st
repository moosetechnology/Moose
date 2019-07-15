Class {
	#name : #RGEmptyLayout,
	#superclass : #RGLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGEmptyLayout >> isEmptyLayout [

	^ true
]

{ #category : #accessing }
RGEmptyLayout >> layoutName [

	^ #EmptyLayout
]
