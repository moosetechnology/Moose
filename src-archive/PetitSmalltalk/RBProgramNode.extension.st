Extension { #name : #RBProgramNode }

{ #category : #'*petitsmalltalk-accessing' }
RBProgramNode >> addComments: aCollectionOfIntervals [
	(aCollectionOfIntervals isNil or: [ aCollectionOfIntervals isEmpty ])
		ifFalse: [ self comments: self comments , aCollectionOfIntervals ]
]
