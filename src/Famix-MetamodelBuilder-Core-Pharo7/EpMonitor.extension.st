Extension { #name : #EpMonitor }

{ #category : #'*Famix-MetamodelBuilder-Core-Pharo7' }
EpMonitor class >> disableDuring: aBlock [
	"Disable the default monitor during the execution of a block"
	
	self current disableDuring: aBlock
]
