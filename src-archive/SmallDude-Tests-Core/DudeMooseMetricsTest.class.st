Class {
	#name : #DudeMooseMetricsTest,
	#superclass : #MooseFileStructureImporterTest,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #setUp }
DudeMooseMetricsTest >> file1 [ 
	 
	^' 
    			fclose( hFrom ) ; 
    			fclose( hTo ) ; 
    			return ; 
    		} 
    		if ( feof( hFrom ) ) 
    			break ; 
    		fputc( c, hTo ) ; 
    		if ( ferror( hTo ) ) 
    		{ 
    			printf( "\nCF write error - ende\n" ) ; 
    			fclose( hFrom ) ; 
    			fclose( hTo ) ; 
    			return ; 
 
asdfasdf 
sdfasdf 
sdfsadf 
ghasdjfghj 
 
 
    			fclose( hFrom ) ; 
    			fclose( hTo ) ; 
    			return ; 
    		} 
    		if ( feof( hFrom ) ) 
    			break ; 
    		fputc( c, hTo ) ; 
    		if ( ferror( hTo ) ) 
    		{ 
    			printf( "\nCF write error - ende\n" ) ; 
    			fclose( hFrom ) ; 
    			fclose( hTo ) ; 
    			return ; 
 
fghfghj 
fghjfghj 
gfhjgfhj 
ghjfghj 
 
 
    			fclose( hFrom ) ; 
    			fclose( hTo ) ; 
    			return ; 
    		} 
    		if ( feof( hFrom ) ) 
    			break ; 
    		fputc( c, hTo ) ; 
    		if ( ferror( hTo ) ) 
    		{ 
    			printf( "\nCF write error - ende\n" ) ; 
    			fclose( hFrom ) ; 
    			fclose( hTo ) ; 
    			return ; 
'
]

{ #category : #setUp }
DudeMooseMetricsTest >> setUp [ 
	 
	| stream file detector | 
	self createDirectory: self foldersString.
	file := self createFile: (self foldersString ,'file1').
	stream := file writeStream. 
	stream nextPutAll: self file1. 
	stream close. 
	model := MooseModel new. 
	(MooseFileStructureImporter new) 
		mooseModel: model; 
		completeImport: (OrderedCollection with: 'folders'). 
	detector := DudeDetector 
		new: DudeCStyleFiles 
		from: model allFiles 
		inModel: model. 
	detector getMultiplicationsWith1032
]

{ #category : #testing }
DudeMooseMetricsTest >> testInternalDupFragmentGrouping [
	self assert: model allFiles size equals: 1.
	self assert: model allDuplications size equals: 3.
	self assert: model allMultiplications size equals: 1.
	self assert: model allFiles first internalFragments size equals: 3.
	self assert: model allFiles first allInternalDuplications size equals: 3.
	self assert: model allFiles first allInternalMultiplications size equals: 1
]
