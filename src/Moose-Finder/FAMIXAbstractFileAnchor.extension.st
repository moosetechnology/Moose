Extension { #name : #FAMIXAbstractFileAnchor }

{ #category : #'*Moose-Finder' }
FAMIXAbstractFileAnchor >> mooseFinderCompleteSourceTextIn: composite [
	<moosePresentationOrder: 11>
	composite
		custom:
			((MooseFileSourceAnchorViewer startOn: self)
				title: 'Complete source';
				titleIcon: MooseIcons mooseSourceText;
				when: [ :input | input mooseInterestingEntity completeText isNotEmpty ])
]

{ #category : #'*Moose-Finder' }
FAMIXAbstractFileAnchor >> mooseFinderParentDirectoryIn: composite [
	<moosePresentationOrder: 12>
	self fileReference exists ifFalse: [ ^ self ].
	(self fileReference parent gtInspectorItemsIn: composite)
			title: 'Parent directory';
			titleIcon: MooseIcons mooseFolder
]
