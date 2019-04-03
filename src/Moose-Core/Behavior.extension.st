Extension { #name : #Behavior }

{ #category : #'*Moose-Core' }
Behavior >> mooseInheritsFrom: aClass [ 

	(self inheritsFrom: aClass) ifTrue: [ ^true].
	(self traits includes: aClass) ifTrue: [ ^true].
	
	^ (self withAllSuperclasses anySatisfy: [:each | each traits includes: aClass ])
		or: [ self traits includes: aClass ]

]

{ #category : #'*Moose-Core' }
Behavior >> usesMooseTraitDirectly: aTrait [

	^ false
]
