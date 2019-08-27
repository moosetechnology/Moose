Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> entityNamed: aMooseName ifAbsentPut: aValue [
	self
		deprecated:
			'This method has a bad behavior because it will not add the entity under the name passed as parameter. This methods will be removed in the next version of Moose. If you want to keep the behavior, please inline the content.'.
	^ self entityNamed: aMooseName ifAbsent: [ self add: aValue ]
]
