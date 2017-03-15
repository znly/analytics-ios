import Quick
import Nimble
import Analytics

class TrackPayloadTest: QuickSpec {
  override func spec() {
    describe("builder") {
      it("fails for null event") {
        expect { SEGTrackPayload(builder: SEGTrackPayloadBuilder()) }.to(raiseException(reason:"event ((null)) must not be null or empty."))
      }
      
      it("fails for empty event") {
        let builder = SEGTrackPayloadBuilder()
        builder.event = ""
        expect { SEGTrackPayload(builder: SEGTrackPayloadBuilder()) }.to(raiseException(reason:"event ((null)) must not be null or empty."))
      }
      
      it("succeeds for valid event") {
        let builder = SEGTrackPayloadBuilder()
        builder.event = "Completed Order"
        
        let payload = SEGTrackPayload(builder: builder)
        expect(payload.event) == "Completed Order"
      }
      
      it("creates empty properties") {
        let builder = SEGTrackPayloadBuilder()
        builder.event = "Completed Order"
        
        let payload = SEGTrackPayload(builder: builder)
        expect(payload.properties).to(beNil())
      }
      
      it("copies properties") {
        let builder = SEGTrackPayloadBuilder()
        builder.event = "Completed Order"
        builder.properties = ["revenue" : 10.99]
        
        let payload = SEGTrackPayload(builder: builder)
        // todo: verify the properties are exact.
        expect(payload.properties).notTo(beNil())
      }
    }
  }
}
