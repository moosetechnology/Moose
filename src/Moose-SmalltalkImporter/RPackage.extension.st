Extension { #name : #RPackage }

{ #category : #'*Moose-SmalltalkImporter' }
RPackage >> regularClassExtensions [

	^ self extensionMethods reject: [:aCompiledMethod | aCompiledMethod methodClass isTrait]
]

{ #category : #'*Moose-SmalltalkImporter' }
RPackage >> regularClasses [

	^ self definedClasses reject: [:each | each isTrait]
]
