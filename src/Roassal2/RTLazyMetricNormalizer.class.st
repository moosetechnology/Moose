Class {
	#name : #RTLazyMetricNormalizer,
	#superclass : #RTObject,
	#instVars : [
		'messages',
		'realNormalizer'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #building }
RTLazyMetricNormalizer >> build [
	messages do: [ :m | m sendTo: realNormalizer ].
]

{ #category : #'reflective operations' }
RTLazyMetricNormalizer >> doesNotUnderstand: message [
	messages add: message
]

{ #category : #accessing }
RTLazyMetricNormalizer >> elements: someElements [
	realNormalizer elements: someElements
]

{ #category : #initialization }
RTLazyMetricNormalizer >> initialize [
	super initialize.
	realNormalizer := RTMetricNormalizer new.
	self resetMessages
]

{ #category : #metrics }
RTLazyMetricNormalizer >> numberOfReceivedMessages [
	^ messages size
]

{ #category : #actions }
RTLazyMetricNormalizer >> resetMessages [
	messages := OrderedCollection new
]
