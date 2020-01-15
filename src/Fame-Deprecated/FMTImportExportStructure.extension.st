Extension { #name : #FMTImportExportStructure }

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> beginAttribute: arg1 [ 
	self deprecated: 'Use #beginProperty: instead.' transformWith: '``@object beginAttribute: ``@arg1 ' -> '``@object beginProperty: ``@arg1 '.
	^ self beginProperty: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> beginElement: arg1 [ 
	self deprecated: 'Use #beginEntity: instead.' transformWith: '``@object beginElement: ``@arg1 ' -> '``@object beginEntity: ``@arg1 '.
	^ self beginEntity: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> endAttribute: arg1 [ 
	self deprecated: 'Use #endProperty: instead.' transformWith: '``@object endAttribute: ``@arg1 ' -> '``@object endProperty: ``@arg1 '.
	^ self endProperty: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> endElement: arg1 [ 
	self deprecated: 'Use #endEntity: instead.' transformWith: '``@object endElement: ``@arg1 ' -> '``@object endEntity: ``@arg1 '.
	^ self endEntity: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> inAttribute: arg1 do: arg2 [ 
	self deprecated: 'Use #inProperty:do: instead.' transformWith: '``@object inAttribute: ``@arg1 do: ``@arg2 ' -> '``@object inProperty: ``@arg1 do: ``@arg2 '.
	^ self inProperty: arg1 do: arg2 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> inElement: arg1 do: arg2 [ 
	self deprecated: 'Use #inEntity:do: instead.' transformWith: '``@object inElement: ``@arg1 do: ``@arg2 ' -> '``@object inEntity: ``@arg1 do: ``@arg2 '.
	^ self inEntity: arg1 do: arg2 
]
