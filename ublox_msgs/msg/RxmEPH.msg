# RXM-EPH (0x02 0x31)
# GPS Aiding Ephemeris Input/Output Message
#
# This message is provided considered obsolete, please use AID-EPH instead!
# - SF1D0 to SF3D7 is only sent if ephemeris is available for this SV. If not, the payload may
#   be reduced to 8 Bytes, or all bytes are set to zero, indicating that this SV Number does
#   not have valid ephemeris for the moment.
# - SF1D0 to SF3D7 contain the 24 words following the Hand-Over Word ( HOW ) from the
#   GPS navigation message, subframes 1 to 3. See IS-GPS-200 for a full description of the
#   contents of the Subframes.
# - In SF1D0 to SF3D7, the parity bits have been removed, and the 24 bits of data are
#   located in Bits 0 to 23. Bits 24 to 31 shall be ignored.
#

uint8 CLASS_ID = 2
uint8 MESSAGE_ID = 49

uint32 svid             # SV ID for which this ephemeris data is (Valid Range: 1 .. 32).
uint32 how              # Hand-Over Word of first Subframe. This is
                        # required if data is sent to the receiver.
                        # 0 indicates that no Ephemeris Data is following.

# Start of optional block
uint32[] sf1d          # Subframe 1 Words 3..10 (SF1D0..SF1D7)
uint32[] sf2d          # Subframe 2 Words 3..10 (SF2D0..SF2D7)
uint32[] sf3d          # Subframe 3 Words 3..10 (SF3D0..SF3D7)
# End of optional block
