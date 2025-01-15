"
No class-specific documentation for RsrEncoderTest, hierarchy is:
Object
  TestAsserter
    TestCase( testSelector)
      RsrTestCase
        RsrCodecTest( registry decoder)
          RsrEncoderTest( connection)

"
Class {
	#name : 'RsrProtocolEncoderV2Test',
	#superclass : 'RsrProtocolEncoderTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrProtocolEncoderV2Test >> protocolVersion [

	^2
]
