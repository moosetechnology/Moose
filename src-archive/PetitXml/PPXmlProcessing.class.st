"
An XML processing instruction.
"
Class {
	#name : #PPXmlProcessing,
	#superclass : #PPXmlData,
	#instVars : [
		'target'
	],
	#category : #'PetitXml-Nodes'
}

{ #category : #'instance creation' }
PPXmlProcessing class >> target: aTargetString data: aString [
	^ self basicNew
		setTarget: aTargetString;
		setData: aString;
		yourself
]

{ #category : #comparing }
PPXmlProcessing >> = anXmlNode [
	^ super = anXmlNode and: [ self target = anXmlNode target ]
]

{ #category : #comparing }
PPXmlProcessing >> hash [
	^ super hash bitXor: self target hash
]

{ #category : #testing }
PPXmlProcessing >> isProcessing [
	^ true
]

{ #category : #printing }
PPXmlProcessing >> printXmlOn: aStream [
	aStream nextPutAll: '<?'; nextPutAll: target; nextPutAll: data; nextPutAll: '?>'
]

{ #category : #initialization }
PPXmlProcessing >> setTarget: aString [
	target := aString
]

{ #category : #accessing }
PPXmlProcessing >> target [
	^ target
]
