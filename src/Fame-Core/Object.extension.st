Extension { #name : #Object }

{ #category : #'*Fame-Core' }
Object >> isFM3Class [
	^false
]

{ #category : #'*Fame-Core' }
Object >> isFM3Package [
	^false
]

{ #category : #'*Fame-Core' }
Object >> isFM3Property [
	^false
]

{ #category : #'*Fame-Core' }
Object >> metamodel [

	^ self class metamodel
]

{ #category : #'*Fame-Core' }
Object class >> metamodel [ 
	^ nil
]

{ #category : #'*Fame-Core' }
Object >> mmGetProperty: aFM3PropertyDescription [
	"Get instance value for a property. Override if you want to handle the property by yourself"

	^ aFM3PropertyDescription getRawFrom: self
]

{ #category : #'*Fame-Core' }
Object >> mmSetProperty: aFM3PropertyDescription to: value [
	"Set instance value for a property"

	aFM3PropertyDescription setOn: self rawValue: value
]
