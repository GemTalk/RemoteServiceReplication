Class {
	#name : 'RsrLogToTranscript',
	#superclass : 'RsrLogDestination',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'writing' }
RsrLogToTranscript >> write: aMessageString [

	Transcript
		show: aMessageString;
		cr
]
