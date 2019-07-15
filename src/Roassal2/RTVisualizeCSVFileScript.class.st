Class {
	#name : #RTVisualizeCSVFileScript,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTVisualizeCSVFileScript >> description [
	^ 
'Let you select a csv file and open a Grapher visualization'
]

{ #category : #hooks }
RTVisualizeCSVFileScript >> execute [
	FileSystem disk inspect
]

{ #category : #hooks }
RTVisualizeCSVFileScript >> label [
	^ 'Browse and visualize CSV file'
]
