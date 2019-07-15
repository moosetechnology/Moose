Extension { #name : #FAMIXMethod }

{ #category : #'*Moose-RoassalPaintings-ClassBlueprint' }
FAMIXMethod >> classBlueprintFillColor [
	
	self isPureAccessor ifTrue: [ ^ Color orange].
	
	self isSetter ifTrue: [ ^ Color red].

	self isGetter ifTrue: [ ^ Color orange].

	self isAbstract ifTrue: [ ^ Color cyan].

	self isOverriding ifTrue: [ ^ Color brown].

	self isConstant ifTrue: [ ^ Color gray].
	
	^ Color white.
]

{ #category : #'*Moose-RoassalPaintings-PackageBlueprint' }
FAMIXMethod >> sureInvokedClasses [
	
	self flag: #fixme.
	^ #()
]
