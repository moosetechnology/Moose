Extension { #name : #FM3Class }

{ #category : #'*Famix-Deprecated' }
FM3Class >> allAttributes [
	self deprecated: 'Use #allProperties instead.' transformWith: '``@object allAttributes' -> '``@object allProperties'.
	^ self allProperties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> allAttributesDo: arg1 [ 
	self deprecated: 'Use #allPropertiesDo: instead.' transformWith: '``@object allAttributesDo: ``@arg1 ' -> '``@object allPropertiesDo: ``@arg1 '.
	^ self allPropertiesDo: arg1 
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> allComplexAttributes [
	self deprecated: 'Use #allComplexProperties instead.' transformWith: '``@object allComplexAttributes' -> '``@object allComplexProperties'.
	^ self allComplexProperties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> allContainerAttributes [
	self deprecated: 'Use #allContainerProperties instead.' transformWith: '``@object allContainerAttributes' -> '``@object allContainerProperties'.
	^ self allContainerProperties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> allPrimitiveAttributes [
	self deprecated: 'Use #allPrimitiveProperties instead.' transformWith: '``@object allPrimitiveAttributes' -> '``@object allPrimitiveProperties'.
	^ self allPrimitiveProperties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> attributeNamed: arg1 [ 
	self deprecated: 'Use #propertyNamed: instead.' transformWith: '``@object attributeNamed: ``@arg1 ' -> '``@object propertyNamed: ``@arg1 '.
	^ self propertyNamed: arg1 
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> attributeNamed: arg1 ifAbsent: arg2 [ 
	self deprecated: 'Use #propertyNamed:ifAbsent: instead.' transformWith: '``@object attributeNamed: ``@arg1 ifAbsent: ``@arg2 ' -> '``@object propertyNamed: ``@arg1 ifAbsent: ``@arg2 '.
	^ self propertyNamed: arg1 ifAbsent: arg2 
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> attributes [
	<MSEProperty: #attributes type: 'FM3.Property'>
	<multivalued>
	self deprecated: 'Use #properties instead.' transformWith: '``@object attributes' -> '``@object properties'.
	^ self properties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> attributes: arg1 [ 
	self deprecated: 'Use #properties: instead.' transformWith: '``@object attributes: ``@arg1 ' -> '``@object properties: ``@arg1 '.
	^ self properties: arg1 
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> attributesNamed: arg1 [ 
	self deprecated: 'Use #propertiesNamed: instead.' transformWith: '``@object attributesNamed: ``@arg1 ' -> '``@object propertiesNamed: ``@arg1 '.
	^ self propertiesNamed: arg1 
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> complexAttributes [
	self deprecated: 'Use #complexProperties instead.' transformWith: '``@object complexAttributes' -> '``@object complexProperties'.
	^ self complexProperties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> ownerAttribute [
	self deprecated: 'Use #ownerProperty instead.' transformWith: '``@object ownerAttribute' -> '``@object ownerProperty'.
	^ self ownerProperty
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> ownerAttributes [
	self deprecated: 'Use #ownerProperties instead.' transformWith: '``@object ownerAttributes' -> '``@object ownerProperties'.
	^ self ownerProperties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> primitiveAttributes [
	self deprecated: 'Use #primitiveProperties instead.' transformWith: '``@object primitiveAttributes' -> '``@object primitiveProperties'.
	^ self primitiveProperties
]

{ #category : #'*Famix-Deprecated' }
FM3Class >> setImplementingClass: arg1 [ 
	self deprecated: 'Use #implementingClass: instead.' transformWith: '``@object setImplementingClass: ``@arg1 ' -> '``@object implementingClass: ``@arg1 '.
	^ self implementingClass: arg1 
]
