"
I generate a downloader script in bash for a Moose image for the given release
"
Class {
	#name : #MooseAbstractZeroConfImageScript,
	#superclass : #ZeroConfImageScript,
	#instVars : [
		'imageName',
		'projectId'
	],
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseAbstractZeroConfImageScript class >> baseUrl [
	^ 'http://get.moosetechnology.org' asZnUrl
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> defaultBasename [
	^ self imageName, self release, 'Image'
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> defaultCombiningScript [
	^ MooseZeroConfCombinedScript
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> htmlTitle [
	^ self imageName, ' Zeroconf Script'
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> imageName [
	^ imageName ifNil: [ 'Moose' ]
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> imageName: aString [
	imageName := aString 
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> imageUrl [
	self subclassResponsibility 
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> projectId [
	^ projectId
]

{ #category : #accessing }
MooseAbstractZeroConfImageScript >> projectId: aString [
	projectId := aString 
]
