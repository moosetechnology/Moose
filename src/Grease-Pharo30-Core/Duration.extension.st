Extension { #name : #Duration }

{ #category : #'*Grease-Pharo30-Core' }
Duration >> asMilliseconds [
	^ self asMilliSeconds
]

{ #category : #'*Grease-Pharo30-Core' }
Duration >> milliseconds [
	^ nanos quo: NanosInMillisecond
]

{ #category : #'*Grease-Pharo30-Core' }
Duration class >> milliseconds: anInteger [
	^ self milliSeconds: anInteger
]
