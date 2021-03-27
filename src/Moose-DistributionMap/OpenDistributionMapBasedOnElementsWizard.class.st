Class {
	#name : #OpenDistributionMapBasedOnElementsWizard,
	#superclass : #OpenDistributionMapWizard,
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
	
 	^ Smalltalk compiler evaluate: (self wizardInformations at: #entitiesToComputeSelector).
	
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

{ #category : #initialization }
OpenDistributionMapBasedOnElementsWizard >> initializeFirstPane: aWizardPane [

	"compositeParts
		add: partTypesCompositePart;
		add: propertyCompositePart."
	aWizardPane addPart: self containersCompositePart associatedTo: #entitiesToComputeSelector.
	aWizardPane addPart: self elementsPart associatedTo: #groupClass.
	aWizardPane addPart: self propertyCompositePart associatedTo: #propertySelector.
	self setConditionsTo: aWizardPane 
]

{ #category : #initialization }
OpenDistributionMapBasedOnElementsWizard >> initializeWithElementGroup: aMooseGroup [
	"DistributionMapWizard new open"

	| propertiyValuesPane partsAndElementsPane |
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
	| tmpDistributionMap |
	super performTerminateButtonAction.
	tmpDistributionMap := (self wizardInformations at: #useColorGradient)
		ifFalse: [ (MooseDistributionMap new
				elements: self mooseGroup
				getContainers: self containersBlock
				property: self propertyBlockOrSelector)
				propertyColorMap: self propertyColorMap;
				propertyValuesIDMap: self propertyValuesMap;
				yourself ]
		ifTrue: [ MooseLinearDistributionMap new
				elements: self mooseGroup
				getContainers: self containersBlock
				property: self propertyBlockOrSelector ].
	tmpDistributionMap open
]

{ #category : #'computing possible parts' }
OpenDistributionMapBasedOnElementsWizard >> possibleContainerTypes [
	"return the list of string to be displayed as possible part types, (when basing the wizard on elements)"

	^ (self groupMetaClasses
		flatCollectAsSet:
			[ :each | each allComplexProperties reject: [ :prop | prop isMultivalued ] ])
		asArray
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
	^ DropListPart new
		list:
			(self groupMetaClasses
				flatCollectAsSet: [ :metaClass | self allPropertySelectorsForElementOfType: metaClass ])
				asArray;
		useLatePopulateContents: false;
		defaultValue: 1;
		"callback: [ :outputValue | propertyTextFieldPart textEntryContents: 'element ' , outputValue ];"
			transformed: [ :outputValue | '[:element | element ' , outputValue , ']' ];
		yourself
]

{ #category : #'initialize - property parts' }
OpenDistributionMapBasedOnElementsWizard >> propertyTextFieldPart [
	^ TextFieldPart new
		prefix: '[:element | ';
		suffix: ']';
		useLatePopulateContents: false;
		returnSuffixAndPrefix: true;
		defaultValue:
			'element '
				,
					(self
						allPropertySelectorsForElementOfType: self groupMetaClasses anyOne)
						first;
		transformed: [ :outputValue | outputValue ];
		yourself
]

{ #category : #initialization }
OpenDistributionMapBasedOnElementsWizard >> setConditionsTo: aWizardPane [

	aWizardPane
		condition: [ :wizardInfos | 
			| isOk |
			isOk := true.
			[ 
			(self containersBlock value: self mooseGroup anyOne) ifNil: [ 
				isOk := false ] ]
				on: Exception
				do: [ isOk := false ].
			isOk ]
		named:
		'Invalid containers selector (the choosen selector might return nil for some elements)'.
	aWizardPane
		condition: [ :wizardInfos | 
			| isOk |
			isOk := true.
			[ 
			(self propertyBlockOrSelector value:
				 self distributionMapElements anyOne) ifNil: [ isOk := false ] ]
				on: Exception
				do: [ isOk := false ].
			isOk ]
		named:
		'Not able to compute properties. (the choosen selector might return nil for some elements)'
]
