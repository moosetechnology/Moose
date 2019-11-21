Extension { #name : #FMTImportExportStructure }

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> beginAttribute: arg1 [ 
	self deprecated: 'Use #beginProperty: instead.' transformWith: '``@object beginAttribute: ``@arg1 ' -> '``@object beginProperty: ``@arg1 '.
	^ self beginProperty: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> beginElement: arg1 [ 
	self deprecated: 'Use #beginClass: instead.' transformWith: '``@object beginElement: ``@arg1 ' -> '``@object beginClass: ``@arg1 '.
	^ self beginClass: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> endAttribute: arg1 [ 
	self deprecated: 'Use #endProperty: instead.' transformWith: '``@object endAttribute: ``@arg1 ' -> '``@object endProperty: ``@arg1 '.
	^ self endProperty: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> endElement: arg1 [ 
	self deprecated: 'Use #endClass: instead.' transformWith: '``@object endElement: ``@arg1 ' -> '``@object endClass: ``@arg1 '.
	^ self endClass: arg1 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> inAttribute: arg1 do: arg2 [ 
	self deprecated: 'Use #inProperty:do: instead.' transformWith: '``@object inAttribute: ``@arg1 do: ``@arg2 ' -> '``@object inProperty: ``@arg1 do: ``@arg2 '.
	^ self inProperty: arg1 do: arg2 
]

{ #category : #'*Fame-Deprecated' }
FMTImportExportStructure >> inElement: arg1 do: arg2 [ 
	self deprecated: 'Use #inClass:do: instead.' transformWith: '``@object inElement: ``@arg1 do: ``@arg2 ' -> '``@object inClass: ``@arg1 do: ``@arg2 '.
	^ self inClass: arg1 do: arg2 
]
