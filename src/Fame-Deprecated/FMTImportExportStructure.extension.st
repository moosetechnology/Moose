Extension { #name : #FMTImportExportStructure }

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> beginAttribute: arg1 [ 
	self deprecated: 'Use #beginProperty: instead.' transformWith: '``@object beginAttribute: ``@arg1 ' -> '``@object beginProperty: ``@arg1 '.
	^ self beginProperty: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> endAttribute: arg1 [ 
	self deprecated: 'Use #endProperty: instead.' transformWith: '``@object endAttribute: ``@arg1 ' -> '``@object endProperty: ``@arg1 '.
	^ self endProperty: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> inAttribute: arg1 do: arg2 [ 
	self deprecated: 'Use #inProperty:do: instead.' transformWith: '``@object inAttribute: ``@arg1 do: ``@arg2 ' -> '``@object inProperty: ``@arg1 do: ``@arg2 '.
	^ self inProperty: arg1 do: arg2 
]
