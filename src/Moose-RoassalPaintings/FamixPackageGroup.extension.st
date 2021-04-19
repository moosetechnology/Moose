Extension { #name : #FamixPackageGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> complexity [
	^ FamixPackageGroupComplexity forPackageGroup: self
]

{ #category : #'*Moose-RoassalPaintings' }
FamixPackageGroup >> dependencies [
	^ FamixContainerGroupDependencies forContainerGroup: self
]
