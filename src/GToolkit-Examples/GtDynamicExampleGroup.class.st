Class {
	#name : #GtDynamicExampleGroup,
	#superclass : #GtExampleGroup,
	#category : #'GToolkit-Examples-Core'
}

{ #category : #subscription }
GtDynamicExampleGroup >> unsubscribe [
	SystemAnnouncer uniqueInstance unsubscribe: self
]
