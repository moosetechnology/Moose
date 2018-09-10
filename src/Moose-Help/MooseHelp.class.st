Class {
	#name : #MooseHelp,
	#superclass : #CustomHelp,
	#category : #'Moose-Help'
}

{ #category : #accessing }
MooseHelp class >> bookName [ 
	^'Moose'
]

{ #category : #documentation }
MooseHelp class >> javaAnalysis [
	^ HelpTopic 
		title: 'Analyzing Java Application'
		contents: 'In order to analyze a Java application in Moose, you need to transform the Java source code into a MSE file. You can use https://github.com/girba/jdt2famix for this.
		
Once loaded, you will have the list of packages of the analyzed application under the category Namespace. Moose consider a Java package as a namespace.
 
allPackages are all the packages _defined_ and _used-but-not-defined_ of your application.
Same for classes and model classes.

If your application is:

public class MyGreatApp extends Object {
	public static void main(String[] args) {
		System.out.println("Hello World");
	}
}

then all model classes will give you the class MyGreatApp. However, allClasses will give you, at least, Object, String, System since your application use these classes, but they are not defined in your application.

'
]

{ #category : #documentation }
MooseHelp class >> license [
	^ HelpTopic 
		title: 'License'
		contents: 'Copyright (c) 1996-2016, University of Berne, Switzerland
Copyright (c) 1996-2016, Moose Contributors

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of the University of Berne nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.'
]

{ #category : #documentation }
MooseHelp class >> overview [
	^ HelpTopic 
		title: 'Overview'
		contents: 
'Moose is a platform for software and data analysis.

It is an open source project since 1996. It is supported by several research groups around the world, and it is increasingly adopted in industrial projects.

Moose offers multiple services ranging from importing and parsing data, to modeling, to measuring, querying, mining, and to building interactive and visual analysis tools.

More information about it can be found on the official website: http://moosetechnology.org'
]

{ #category : #accessing }
MooseHelp class >> pages [
	^#(overview javaAnalysis license signature)
]

{ #category : #documentation }
MooseHelp class >> signature [
	^ HelpTopic 
		title: 'Image signature'
		contents: MooseImage current printString
]
