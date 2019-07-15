Extension { #name : #String }

{ #category : #'*moose-hismoimporter' }
String >> asDateWithPattern: aPattern [

	^ Date readFrom: self readStream readStream pattern: aPattern
]
