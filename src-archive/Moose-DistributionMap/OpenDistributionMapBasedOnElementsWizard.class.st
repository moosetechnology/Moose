Class {
	#name : #OpenDistributionMapBasedOnElementsWizard,
	#superclass : #OpenDistributionMapWizard,
	#instVars : [
		'properties'
	],
	#category : #'Moose-DistributionMap'
}

{ #category : #'instance creation' }
OpenDistributionMapBasedOnElementsWizard class >> onGroup: aMooseGroup [

	^super new initializeWithElementGroup: aMooseGroup ; yourself.
]

{ #category : #accessing }
OpenDistributionMapBasedOnElementsWizard >> computeAndReturnDistributionMapElements [

	^ self mooseGroup
]

{ #category : #'accessing map parameters' }
OpenDistributionMapBasedOnElementsWizard >> containersBlock [
	
 	^ Smalltalk evaluate: (self wizardInformations at: #entitiesToComputeSelector).
	
]

{ #category : #'initialize - containers parts' }
OpenDistributionMapBasedOnElementsWizard >> containersCompositePart [

	^ (CompositePart new)
		inGroupboxNamed: 'Select type of parts';
		useLatePopulateContents: false;
		withTitlesAndParts:
				{('Using pre-initialized list' -> self containersListPart ).
					('Entering a block' -> self containersTextFieldPart )};
		yourself.
]

{ #category : #'initialize - containers parts' }
OpenDistributionMapBasedOnElementsWizard >> containersListPart [
	^ (DropListPart new)
		list: self possibleContainerTypes;
		defaultValue: 1;
		useLatePopulateContents: false;
		format: [:aFM3Property | aFM3Property type name, ' ( using ', aFM3Property name, ' )' ];
		transformed: [:aFM3Property | ('[:element | element ' , aFM3Property name , ']')]
		yourself
]

{ #category : #'initialize - containers parts' }
OpenDistributionMapBasedOnElementsWizard >> containersTextFieldPart [
	^ (TextFieldPart new)
		prefix: '[:element | ';
		suffix: ']';
		useLatePopulateContents: false;
		returnSuffixAndPrefix: true;
		transformed: [:outPutValue | outPutValue];
		defaultValue: 'element belongsTo'
]

{ #category : #'initialize - elements parts' }
OpenDistributionMapBasedOnElementsWizard >> elementsPart [
	^ (TextPart new)
		text:
				self groupClass asString asText allBold , Character cr asString
						, '=> launch distributionMap from corresponding groups to visualize from other type of elements';
		inGroupboxNamed: 'Type of elements';
		yourself
]

{ #category : #'initialize-release' }
OpenDistributionMapBasedOnElementsWizard >> initializeFirstPane: aWizardPane [

	"compositeParts
		add: partTypesCompositePart;
		add: propertyCompositePart."
	aWizardPane addPart: self containersCompositePart associatedTo: #entitiesToComputeSelector.
	aWizardPane addPart: self elementsPart associatedTo: #groupClass.
	aWizardPane addPart: self propertyCompositePart associatedTo: #propertySelector.
	self setConditionsTo: aWizardPane 
]

{ #category : #'initialize-release' }
OpenDistributionMapBasedOnElementsWizard >> initializeWithElementGroup: aMooseGroup [
	"DistributionMapWizard new open"

	| lastPane  propertyTextFieldPart propertiyValuesPane textEditorPart partsAndElementsPane |
	"When using a compositePart, we  don't at the end which part has been selected, and therefore which kind of value will be returned. For that, I store each compositePart in a collection, to ask them at the end which part is selected"
	compositeParts := OrderedCollection new.
	self mooseGroup: aMooseGroup .
	
	partsAndElementsPane := WizardFirstPane named: 'Parts and elements'.
	self initializeFirstPane: partsAndElementsPane.
	propertiyValuesPane := WizardLastPane named: 'Property values'.
	
	
	self addPane: partsAndElementsPane .
	self addPane: propertiyValuesPane .


	self initializePropertyValuesPane: propertiyValuesPane .
	
	
	

	
]

{ #category : #'wizard panes transition' }
OpenDistributionMapBasedOnElementsWizard >> performTerminateButtonAction [
	"by default, just close the last current pane. Override this method if you want to create a subclass of WizardControl making a specific action"

	|tmpDistributionMap|
	super performTerminateButtonAction.
	tmpDistributionMap := DistributionMap 
		onElements: self mooseGroup 
		containers: self containersBlock 
		properties: self propertyBlockOrSelector.

	(self wizardInformations at: #useDefaultColors) 
		ifFalse: [
			tmpDistributionMap 
				propertyColorMap: self propertyColorMap;
				propertyValuesMap: self propertyValuesMap.
			].
	tmpDistributionMap open
]

{ #category : #'computing possible parts' }
OpenDistributionMapBasedOnElementsWizard >> possibleContainerTypes [

	"return the list of string to be displayed as possible part types, (when basing the wizard on elements)"
	"| allMetaClasses result |
	result := OrderedCollection new.
	allMetaClasses := MooseModel meta elements select: [:each | each isFM3Class].
	allMetaClasses do: [:aFM3Class |
		|possibleAttributes|
		(self mooseModel includesElementsOfType: aFM3Class implementingClass) ifTrue: [
			possibleAttributes := aFM3Class allAttributesReturningType: self groupMetaClass inModel: self mooseModel. 
			possibleAttributes do: [:each | 
				(self mooseModel includesElementsOfType: aFM3Class implementingClass)
				ifTrue: [
					each opposite ifNotNil: [
						result add: each opposite
						].
					]. 
				].
			].
		].
	^ result asSet asOrderedCollection."
	
	^ self groupMetaClass allComplexAttributes select: [:aFM3Property |
		aFM3Property isMultivalued not
		"aFM3Property hasOpposite and: [aFM3Property opposite isMultivalued]"
		].
]

{ #category : #'initialize - property parts' }
OpenDistributionMapBasedOnElementsWizard >> propertyCompositePart [
	.
	^ (CompositePart new)
		inGroupboxNamed: 'Select propertySelector to use';
		useLatePopulateContents: false;
		withTitlesAndParts:
				{('Using pre-initialized list' ->  ( self propertyListPart)).
					('Entering a block' -> self propertyTextFieldPart)}
]

{ #category : #'initialize - property parts' }
OpenDistributionMapBasedOnElementsWizard >> propertyListPart [

	^ (DropListPart new)
		list: (self allPropertySelectorsForElementOfType: self groupClass);
		useLatePopulateContents: false;
		defaultValue: 1;
		"callback: [ :outputValue | propertyTextFieldPart textEntryContents: 'element ' , outputValue ];"
		transformed: [ :outputValue | '[:element | element ' , outputValue , ']' ];
		yourself
]

{ #category : #'initialize - property parts' }
OpenDistributionMapBasedOnElementsWizard >> propertyTextFieldPart [

	^TextFieldPart new 
			prefix: '[:element | '; 
			suffix: ']' ;
			useLatePopulateContents: false;  
			returnSuffixAndPrefix: true; 
			defaultValue: ('element ' ,  (self allPropertySelectorsForElementOfType: self groupClass) first);
			transformed: [:outputValue |  outputValue];
			yourself.
]

{ #category : #'initialize-release' }
OpenDistributionMapBasedOnElementsWizard >> setConditionsTo: aWizardPane [

	aWizardPane
		condition: [ :wizardInfos | 
			| isOk |
			isOk := true.
			[ 
			 (self containersBlock rtValue: self mooseGroup anyOne) ifNil: [ isOk := false ] .
			 ] on: Exception do: [ isOk := false ].
			isOk ]
		named: 'Invalid containers selector (the choosen selector might return nil for some elements)'.
	aWizardPane
		condition: [ :wizardInfos | 
			| isOk |
			isOk := true.
			[ 
			(self propertyBlockOrSelector rtValue: self distributionMapElements anyOne) ifNil: [ isOk := false ]
			 ] on: Exception do: [ isOk := false ].
			isOk ]
		named: 'Not able to compute properties. (the choosen selector might return nil for some elements)'
]
