require './caesar'

describe "#caesar_cipher" do
    it "shifts an all lowercase string" do
        expect(caesar_cipher("hal",1)).to eql("ibm")
    end
    it "shifts an all uppercase string" do
        expect(caesar_cipher("HAL",1)).to eql("IBM")
    end
    it "shifts a mixed-case string" do
        expect(caesar_cipher("Hal",1)).to eql("Ibm")
    end
    it "wraps when shifting a mixed-case string" do
        expect(caesar_cipher("Ibm",25)).to eql("Hal")
    end
    it "maintains punctuation" do
        expect(caesar_cipher("What a string!",5)).to eql("Bmfy f xywnsl!")
    end
end