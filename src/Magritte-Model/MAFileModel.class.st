"
I represent a file with filename, mimetype and contents within the Magritte framework.

There are different file-models that you can use with Magritte. The idea is that you set the ==#kind:== of an MAFileDescription to one of the subclasses of ==*MAFileModel*==.
"
Class {
	#name : #MAFileModel,
	#superclass : #MABasicObject,
	#instVars : [
		'filename',
		'mimetype',
		'filesize'
	],
	#classVars : [
		'MimeTypes'
	],
	#category : #'Magritte-Model-Models'
}

{ #category : #'accessing-defaults' }
MAFileModel class >> defaultMimeType [
	^ 'application/octet-stream'
]

{ #category : #'accessing-defaults' }
MAFileModel class >> defaultMimeTypes [
	^ #( '323' 'text/h323' 'acx' 'application/internet-property-stream' 'ai' 'application/postscript' 'aif' 'audio/x-aiff' 'aifc' 'audio/x-aiff' 'aiff' 'audio/x-aiff' 'asc' 'text/plain' 'asf' 'video/x-ms-asf' 'asr' 'video/x-ms-asf' 'asx' 'video/x-ms-asf' 'au' 'audio/basic' 'avi' 'video/x-msvideo' 'axs' 'application/olescript' 'bas' 'text/plain' 'bcpio' 'application/x-bcpio' 'bin' 'application/octet-stream' 'bmp' 'image/bmp' 'c' 'text/plain' 'cat' 'application/vnd.ms-pkiseccat' 'cc' 'text/plain' 'ccad' 'application/clariscad' 'cdf' 'application/x-netcdf' 'cer' 'application/x-x509-ca-cert' 'class' 'application/octet-stream' 'clp' 'application/x-msclip' 'cmx' 'image/x-cmx' 'cod' 'image/cis-cod' 'cpio' 'application/x-cpio' 'cpt' 'application/mac-compactpro' 'crd' 'application/x-mscardfile' 'crl' 'application/pkix-crl' 'crt' 'application/x-x509-ca-cert' 'csh' 'application/x-csh' 'css' 'text/css' 'dcr' 'application/x-director' 'der' 'application/x-x509-ca-cert' 'dir' 'application/x-director' 'dll' 'application/x-msdownload' 'dms' 'application/octet-stream' 'doc' 'application/msword' 'dot' 'application/msword' 'drw' 'application/drafting' 'dtd' 'application/xml-dtd' 'dvi' 'application/x-dvi' 'dwg' 'application/acad' 'dxf' 'application/dxf' 'dxr' 'application/x-director' 'eps' 'application/postscript' 'etx' 'text/x-setext' 'evy' 'application/envoy' 'exe' 'application/octet-stream' 'ez' 'application/andrew-inset' 'f' 'text/plain' 'f90' 'text/plain' 'fif' 'application/fractals' 'fli' 'video/x-fli' 'flr' 'x-world/x-vrml' 'gif' 'image/gif' 'gtar' 'application/x-gtar' 'gz' 'application/x-gzip' 'h' 'text/plain' 'hdf' 'application/x-hdf' 'hh' 'text/plain' 'hlp' 'application/winhlp' 'hqx' 'application/mac-binhex40' 'hta' 'application/hta' 'htc' 'text/x-component' 'htm' 'text/html' 'html' 'text/html' 'htt' 'text/webviewhtml' 'ice' 'x-conference/x-cooltalk' 'ico' 'image/vnd.microsoft.icon' 'ief' 'image/ief' 'iges' 'model/iges' 'igs' 'model/iges' 'iii' 'application/x-iphone' 'ins' 'application/x-internet-signup' 'ips' 'application/x-ipscript' 'ipx' 'application/x-ipix' 'isp' 'application/x-internet-signup' 'jfif' 'image/pipeg' 'jpe' 'image/jpeg' 'jpeg' 'image/jpeg' 'jpg' 'image/jpeg' 'js' 'application/javascript' 'json' 'application/json' 'kar' 'audio/midi' 'latex' 'application/x-latex' 'lha' 'application/octet-stream' 'lsf' 'video/x-la-asf' 'lsp' 'application/x-lisp' 'lsx' 'video/x-la-asf' 'lzh' 'application/octet-stream' 'm' 'text/plain' 'm13' 'application/x-msmediaview' 'm14' 'application/x-msmediaview' 'm3u' 'audio/x-mpegurl' 'man' 'application/x-troff-man' 'mdb' 'application/x-msaccess' 'me' 'application/x-troff-me' 'mesh' 'model/mesh' 'mht' 'message/rfc822' 'mhtml' 'message/rfc822' 'mid' 'audio/midi' 'midi' 'audio/midi' 'mif' 'application/vnd.mif' 'mime' 'www/mime' 'mny' 'application/x-msmoney' 'mov' 'video/quicktime' 'movie' 'video/x-sgi-movie' 'mp2' 'audio/mpeg' 'mp3' 'audio/mpeg' 'mpa' 'video/mpeg' 'mpe' 'video/mpeg' 'mpeg' 'video/mpeg' 'mpg' 'video/mpeg' 'mpga' 'audio/mpeg' 'mpp' 'application/vnd.ms-project' 'mpv2' 'video/mpeg' 'ms' 'application/x-troff-ms' 'msh' 'model/mesh' 'mvb' 'application/x-msmediaview' 'nc' 'application/x-netcdf' 'nws' 'message/rfc822' 'oda' 'application/oda' 'ogg' 'application/ogg' 'p10' 'application/pkcs10' 'p12' 'application/x-pkcs12' 'p7b' 'application/x-pkcs7-certificates' 'p7c' 'application/x-pkcs7-mime' 'p7m' 'application/x-pkcs7-mime' 'p7r' 'application/x-pkcs7-certreqresp' 'p7s' 'application/x-pkcs7-signature' 'pbm' 'image/x-portable-bitmap' 'pdb' 'chemical/x-pdb' 'pdf' 'application/pdf' 'pfx' 'application/x-pkcs12' 'pgm' 'image/x-portable-graymap' 'pgn' 'application/x-chess-pgn' 'pko' 'application/ynd.ms-pkipko' 'pma' 'application/x-perfmon' 'pmc' 'application/x-perfmon' 'pml' 'application/x-perfmon' 'pmr' 'application/x-perfmon' 'pmw' 'application/x-perfmon' 'png' 'image/png' 'pnm' 'image/x-portable-anymap' 'pot' 'application/mspowerpoint' 'ppm' 'image/x-portable-pixmap' 'pps' 'application/mspowerpoint' 'ppt' 'application/mspowerpoint' 'ppz' 'application/mspowerpoint' 'pre' 'application/x-freelance' 'prf' 'application/pics-rules' 'prt' 'application/pro_eng' 'ps' 'application/postscript' 'pub' 'application/x-mspublisher' 'qt' 'video/quicktime' 'ra' 'audio/x-realaudio' 'ram' 'audio/x-pn-realaudio' 'ras' 'image/cmu-raster' 'rgb' 'image/x-rgb' 'rm' 'audio/x-pn-realaudio' 'rmi' 'audio/mid' 'roff' 'application/x-troff' 'rpm' 'audio/x-pn-realaudio-plugin' 'rtf' 'application/rtf' 'rtx' 'text/richtext' 'scd' 'application/x-msschedule' 'scm' 'application/x-lotusscreencam' 'sct' 'text/scriptlet' 'set' 'application/set' 'setpay' 'application/set-payment-initiation' 'setreg' 'application/set-registration-initiation' 'sgm' 'text/sgml' 'sgml' 'text/sgml' 'sh' 'application/x-sh' 'shar' 'application/x-shar' 'silo' 'model/mesh' 'sit' 'application/x-stuffit' 'skd' 'application/x-koan' 'skm' 'application/x-koan' 'skp' 'application/x-koan' 'skt' 'application/x-koan' 'smi' 'application/smil' 'smil' 'application/smil' 'snd' 'audio/basic' 'sol' 'application/solids' 'spc' 'application/x-pkcs7-certificates' 'spl' 'application/futuresplash' 'src' 'application/x-wais-source' 'sst' 'application/vnd.ms-pkicertstore' 'step' 'application/STEP' 'stl' 'application/vnd.ms-pkistl' 'stm' 'text/html' 'stp' 'application/STEP' 'sv4cpio' 'application/x-sv4cpio' 'sv4crc' 'application/x-sv4crc' 'svg' 'image/svg+xml' 'swf' 'application/x-shockwave-flash' 't' 'application/x-troff' 'tar' 'application/x-tar' 'tcl' 'application/x-tcl' 'tex' 'application/x-tex' 'texi' 'application/x-texinfo' 'texinfo' 'application/x-texinfo' 'tgz' 'application/x-compressed' 'tif' 'image/tiff' 'tiff' 'image/tiff' 'tr' 'application/x-troff' 'trm' 'application/x-msterminal' 'tsi' 'audio/TSP-audio' 'tsp' 'application/dsptype' 'tsv' 'text/tab-separated-values' 'txt' 'text/plain' 'uls' 'text/iuls' 'unv' 'application/i-deas' 'ustar' 'application/x-ustar' 'vcd' 'application/x-cdlink' 'vcf' 'text/x-vcard' 'vda' 'application/vda' 'viv' 'video/vnd.vivo' 'vivo' 'video/vnd.vivo' 'vrml' 'model/vrml' 'wav' 'audio/x-wav' 'wcm' 'application/vnd.ms-works' 'wdb' 'application/vnd.ms-works' 'wks' 'application/vnd.ms-works' 'wmf' 'application/x-msmetafile' 'wps' 'application/vnd.ms-works' 'wri' 'application/x-mswrite' 'wrl' 'model/vrml' 'wrz' 'x-world/x-vrml' 'xaf' 'x-world/x-vrml' 'xbm' 'image/x-xbitmap' 'xhtml' 'application/xhtml+xml' 'xla' 'application/vnd.ms-excel' 'xlc' 'application/vnd.ms-excel' 'xll' 'application/vnd.ms-excel' 'xlm' 'application/vnd.ms-excel' 'xls' 'application/vnd.ms-excel' 'xlt' 'application/vnd.ms-excel' 'xlw' 'application/vnd.ms-excel' 'xml' 'text/xml' 'xof' 'x-world/x-vrml' 'xpm' 'image/x-xpixmap' 'xwd' 'image/x-xwindowdump' 'xyz' 'chemical/x-pdb' 'z' 'application/x-compress' 'zip' 'application/zip' )
]

{ #category : #initialization }
MAFileModel class >> initialize [
	MimeTypes := Dictionary new.
	1 to: self defaultMimeTypes size by: 2 do: [ :index |
		MimeTypes 
			at: (self defaultMimeTypes at: index)
			put: (self defaultMimeTypes at: index + 1) ]
]

{ #category : #accessing }
MAFileModel class >> mimetypeFor: aString [
	^ self mimetypes at: aString ifAbsent: [ self defaultMimeType ]
]

{ #category : #accessing }
MAFileModel class >> mimetypes [
	^ MimeTypes
]

{ #category : #'accessing-defaults' }
MAFileModel class >> validCharacters [
	"Answer a string with all the valid characters for filenames."
	
	^ '-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz'
]

{ #category : #comparing }
MAFileModel >> = anObject [
	^ self species = anObject species
		and: [ self filename = anObject filename
		and: [ self mimetype = anObject mimetype ] ]
]

{ #category : #accessing }
MAFileModel >> contents [
	"Answer the contents of the file. This method is supposed to be overridden by concrete subclasses."

	self subclassResponsibility
]

{ #category : #accessing }
MAFileModel >> contents: aByteArray [
	"Set the contents of the receiver. This method is supposed to be overridden by concrete subclasses."

	filesize := aByteArray size
]

{ #category : #'accessing-dynamic' }
MAFileModel >> extension [
	"Answer the file-extension."

	^ self filename copyAfterLast: $.
]

{ #category : #accessing }
MAFileModel >> filename [
	"Answer the filename of the receiver."

	^ filename
]

{ #category : #accessing }
MAFileModel >> filename: aString [
	"Normalize the filenames. Don't just allow any stupid windows filename.'"

	filename := aString isNil ifFalse: [ 
		aString collect: [ :char |
			(self class validCharacters includes: char)
				ifTrue: [ char ]
				ifFalse: [ 
					char = Character space
						ifTrue: [ $- ]
						ifFalse: [ $_ ] ] ] ]
]

{ #category : #'accessing-dynamic' }
MAFileModel >> filesize [
	"Answer the size of the file."

	^ filesize
]

{ #category : #finalization }
MAFileModel >> finalize [
	"Cleanup after a file is removed, subclasses might require to specialize this method."
	
	self initialize
]

{ #category : #comparing }
MAFileModel >> hash [
	^ self filename hash bitXor: self mimetype hash
]

{ #category : #initialization }
MAFileModel >> initialize [
	super initialize.
	filesize := 0.
	filename := 'unknown'.
	mimetype := self class defaultMimeType
]

{ #category : #'testing-types' }
MAFileModel >> isApplication [
	"Return ==true== if the mimetype of the receiver is application-data. This message will match types like: application/postscript, application/zip, application/pdf, etc."

	^ self maintype = 'application'
]

{ #category : #'testing-types' }
MAFileModel >> isAudio [
	"Return ==true== if the mimetype of the receiver is audio-data. This message will match types like: audio/basic, audio/tone, audio/mpeg, etc."

	^ self maintype = 'audio'
]

{ #category : #testing }
MAFileModel >> isEmpty [
	^ self filesize isZero
]

{ #category : #'testing-types' }
MAFileModel >> isImage [
	"Return ==true== if the mimetype of the receiver is image-data. This message will match types like: image/jpeg, image/gif, image/png, image/tiff, etc."

	^ self maintype = 'image'
]

{ #category : #'testing-types' }
MAFileModel >> isText [
	"Return ==true== if the mimetype of the receiver is text-data. This message will match types like: text/plain, text/html, text/sgml, text/css, text/xml, text/richtext, etc."

	^ self maintype = 'text'
]

{ #category : #'testing-types' }
MAFileModel >> isVideo [
	"Return ==true== if the mimetype of the receiver is video-data. This message will match types like: video/mpeg, video/quicktime, etc."

	^ self maintype = 'video'
]

{ #category : #'accessing-dynamic' }
MAFileModel >> maintype [
	"Answer the first part of the mime-type."

	^ self mimetype copyUpTo: $/
]

{ #category : #accessing }
MAFileModel >> mimetype [
	"Answer the mimetype of the receiver."

	^ mimetype
]

{ #category : #accessing }
MAFileModel >> mimetype: aString [
	mimetype := aString
]

{ #category : #'accessing-dynamic' }
MAFileModel >> readStream [
	^ self contents readStream
]

{ #category : #'accessing-dynamic' }
MAFileModel >> subtype [
	"Answer the second part of the mime-type."

	^ self mimetype copyAfter: $/
]
