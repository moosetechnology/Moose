Extension { #name : #FamixJavaType }

{ #category : #'*Famix-Deprecated' }
FamixJavaType >> container [
	<FMProperty: #container type: #FamixJavaContainerEntity>
	<FMComment: 'Deprected, use typeContainer'>
	self deprecated: 'Use #typeContainer instead.' transformWith: '`@receiver container' -> '`@receiver typeContainer'.
	^ self typeContainer
]

{ #category : #'*Famix-Deprecated' }
FamixJavaType >> container: anEntity [
	self deprecated: 'Use #typeContainer: instead.' transformWith: '`@receiver container: `@argument' -> '`@receiver typeContainer: `@argument'.
	^ self typeContainer: anEntity
]
