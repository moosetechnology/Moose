Extension { #name : #FM3Class }

{ #category : #'*Fame-Deprecated' }
FM3Class >> allAttributes [
	self deprecated: 'Use #allProperties instead.' transformWith: '``@object allAttributes' -> '``@object allProperties'.
	^ self allProperties
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> allAttributesDo: arg1 [ 
	self deprecated: 'Use #allPropertiesDo: instead.' transformWith: '``@object allAttributesDo: ``@arg1 ' -> '``@object allPropertiesDo: ``@arg1 '.
	^ self allPropertiesDo: arg1 
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> allComplexAttributes [
	self deprecated: 'Use #allComplexProperties instead.' transformWith: '``@object allComplexAttributes' -> '``@object allComplexProperties'.
	^ self allComplexProperties
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> allContainerAttributes [
	self deprecated: 'Use #allContainerProperties instead.' transformWith: '``@object allContainerAttributes' -> '``@object allContainerProperties'.
	^ self allContainerProperties
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> allPrimitiveAttributes [
	self deprecated: 'Use #allPrimitiveProperties instead.' transformWith: '``@object allPrimitiveAttributes' -> '``@object allPrimitiveProperties'.
	^ self allPrimitiveProperties
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> at: aString [
	self deprecated: 'Use #propertyNamed: instead.' transformWith: '`@receiver at: `@arg' -> '`@receiver propertyNamed: `@arg'.
	^ self propertyNamed: aString
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> attributeNamed: arg1 [ 
	self deprecated: 'Use #propertyNamed: instead.' transformWith: '``@object attributeNamed: ``@arg1 ' -> '``@object propertyNamed: ``@arg1 '.
	^ self propertyNamed: arg1 
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> attributeNamed: arg1 ifAbsent: arg2 [ 
	self deprecated: 'Use #propertyNamed:ifAbsent: instead.' transformWith: '``@object attributeNamed: ``@arg1 ifAbsent: ``@arg2 ' -> '``@object propertyNamed: ``@arg1 ifAbsent: ``@arg2 '.
	^ self propertyNamed: arg1 ifAbsent: arg2 
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> attributes [
	<FMProperty: #attributes type: 'FM3.Property'>
	<multivalued>
	self deprecated: 'Use #properties instead.' transformWith: '``@object attributes' -> '``@object properties'.
	^ self properties
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> attributes: arg1 [ 
	self deprecated: 'Use #properties: instead.' transformWith: '``@object attributes: ``@arg1 ' -> '``@object properties: ``@arg1 '.
	^ self properties: arg1 
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> attributesNamed: arg1 [ 
	self deprecated: 'Use #propertiesNamed: instead.' transformWith: '``@object attributesNamed: ``@arg1 ' -> '``@object propertiesNamed: ``@arg1 '.
	^ self propertiesNamed: arg1 
]

{ #category : #'*Fame-Deprecated' }
FM3Class class >> boolean [
	self deprecated: 'Use FM3Boolean class>>#instance instead.' transformWith: 'FM3Class boolean' -> 'FM3Boolean instance'.
	^ FM3Boolean instance
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> complexAttributes [
	self deprecated: 'Use #complexProperties instead.' transformWith: '``@object complexAttributes' -> '``@object complexProperties'.
	^ self complexProperties
]

{ #category : #'*Fame-Deprecated' }
FM3Class class >> constantsDo: aBlock [
	self deprecated: 'Use FM3Constant class>>constantsDo: instead.' transformWith: 'FM3Class constantsDo: `@arg' -> 'FM3Constant constantsDo: `@arg'.
	FM3Constant constantsDo: aBlock
]

{ #category : #'*Fame-Deprecated' }
FM3Class class >> number [
	self deprecated: 'Use FM3Number class>>#instance instead.' transformWith: 'FM3Class number' -> 'FM3Number instance'.
	^ FM3Number instance
]

{ #category : #'*Fame-Deprecated' }
FM3Class class >> object [
	self deprecated: 'Use FM3Object class>>#instance instead.' transformWith: 'FM3Class object' -> 'FM3Object instance'.
	^ FM3Object instance
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> ownerAttributes [
	self deprecated: 'Use #ownerProperties instead.' transformWith: '``@object ownerAttributes' -> '``@object ownerProperties'.
	^ self ownerProperties
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> primitiveAttributes [
	self deprecated: 'Use #primitiveProperties instead.' transformWith: '``@object primitiveAttributes' -> '``@object primitiveProperties'.
	^ self primitiveProperties
]

{ #category : #'*Fame-Deprecated' }
FM3Class >> setImplementingClass: arg1 [ 
	self deprecated: 'Use #implementingClass: instead.' transformWith: '``@object setImplementingClass: ``@arg1 ' -> '``@object implementingClass: ``@arg1 '.
	^ self implementingClass: arg1 
]

{ #category : #'*Fame-Deprecated' }
FM3Class class >> string [
	self deprecated: 'Use FM3String class>>#instance instead.' transformWith: 'FM3Class string' -> 'FM3String instance'.
	^ FM3String instance
]
