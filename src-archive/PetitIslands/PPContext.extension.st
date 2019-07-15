Extension { #name : #PPContext }

{ #category : #'*petitislands' }
PPContext >> islandInvoke [
	"profiling message, nothing to do here, see PPProfilingContext for more details"
]

{ #category : #'*petitislands' }
PPContext >> islandMemoHit [
	"profiling message, nothing to do here, see PPProfilingContext for more details"
]

{ #category : #'*petitislands' }
PPContext >> islandMemoized [
	"profiling message, nothing to do here, see PPProfilingContext for more details"
]

{ #category : #'*petitislands' }
PPContext >> waterPosition [
	^ self globalAt:  #waterPosition ifAbsentPut: nil
]

{ #category : #'*petitislands' }
PPContext >> waterPosition: position [
	^ self globalAt:  #waterPosition put: position
]

{ #category : #'*petitislands' }
PPContext >> waterToken [
	"profiling message, nothing to do here, see PPProfilingContext for more details"
]
