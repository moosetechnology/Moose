Class {
	#name : #MooseZeroConfCurrentImageScript,
	#superclass : #MooseAbstractZeroConfImageScript,
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseZeroConfCurrentImageScript class >> fileBaseUrl [
	^ 'https://ci.inria.fr/moose/job' asZnUrl
]

{ #category : #'instance creation' }
MooseZeroConfCurrentImageScript class >> glamour25Image [
	^ (self latestProject: 'glamour' release: '25')
		imageName: 'Glamour';
		yourself
]

{ #category : #'instance creation' }
MooseZeroConfCurrentImageScript class >> latestProject: aProjectId release: releaseString [
	"Create a new zeroconf script exporter for latest version of the given release and project"
	^ self new
		projectId: aProjectId;
		release: releaseString;
		version: 'lastSuccessfulBuild';
		yourself
]

{ #category : #'instance creation' }
MooseZeroConfCurrentImageScript class >> moose50Image [
	^ self latestProject: 'moose-5.0' release: '50'
]

{ #category : #'instance creation' }
MooseZeroConfCurrentImageScript class >> mooseLatestImage [
	^ self moose50Image
		basename: 'MooseLatestImage'
]

{ #category : #'instance creation' }
MooseZeroConfCurrentImageScript class >> petitparser16Image [
	^ (self latestProject: 'petitparser' release: '16')
		imageName: 'PetitParser';
		yourself
]

{ #category : #accessing }
MooseZeroConfCurrentImageScript >> imageUrl [
	^ self fileBaseUrl / self projectId / self version asString / 'artifact' / self imageZip
]

{ #category : #accessing }
MooseZeroConfCurrentImageScript >> imageZip [
	^ self projectId, '.zip'
]
