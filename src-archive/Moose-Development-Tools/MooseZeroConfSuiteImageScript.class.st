Class {
	#name : #MooseZeroConfSuiteImageScript,
	#superclass : #MooseAbstractZeroConfImageScript,
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseZeroConfSuiteImageScript class >> fileBaseUrl [
	^ 'https://dl.dropboxusercontent.com/u/18323746' asZnUrl
]

{ #category : #'instance creation' }
MooseZeroConfSuiteImageScript class >> moose49Image [
	^ self new
		projectId: 'moose_suite_4_9';
		release: '49';
		yourself
]

{ #category : #accessing }
MooseZeroConfSuiteImageScript >> imageUrl [
	^ self fileBaseUrl / self imageName / self imageZip
]

{ #category : #accessing }
MooseZeroConfSuiteImageScript >> imageZip [
	^ self projectId, '-image.zip'
]
